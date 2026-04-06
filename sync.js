const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

async function retry(fn, retries = 3, delay = 2000) {
  for (let i = 0; i < retries; i++) {
    try {
      return await fn();
    } catch (err) {
      if (i === retries - 1) throw err;
      console.log(`⚠️ 재시도 중... (${i + 1}/${retries})`);
      await new Promise(res => setTimeout(res, delay));
    }
  }
}

async function getTitle(pageId) {
  const page = await retry(() => notion.pages.retrieve({ page_id: pageId }));
  return (
    page.properties?.title?.title?.[0]?.plain_text ||
    page.properties?.Name?.title?.[0]?.plain_text ||
    "untitled"
  );
}

async function processBlocks(blocks, dirPath) {
  for (const block of blocks) {
    if (block.type === "child_page") {
      const childTitle = block.child_page.title.replace(/[\/\\:*?"<>|]/g, "_");
      const childDir = path.join(dirPath, childTitle);
      await syncPage(block.id, childDir);

    } else if (block.type === "link_to_page" && block.link_to_page?.page_id) {
      const linkedPageId = block.link_to_page.page_id;
      const linkedTitle = (await getTitle(linkedPageId)).replace(/[\/\\:*?"<>|]/g, "_");
      const childDir = path.join(dirPath, linkedTitle);
      await syncPage(linkedPageId, childDir);

    } else if (block.type === "child_database") {
      const childTitle = (block.child_database.title || "database").replace(/[\/\\:*?"<>|]/g, "_");
      const childDir = path.join(dirPath, childTitle);
      if (!fs.existsSync(childDir)) fs.mkdirSync(childDir, { recursive: true });
    
      // DB 안의 페이지들 가져오기
      const dbPages = await retry(() => notion.databases.query({ database_id: block.id }));
      for (const dbPage of dbPages.results) {
        const dbPageTitle = (
          dbPage.properties?.Name?.title?.[0]?.plain_text ||
          dbPage.properties?.title?.title?.[0]?.plain_text ||
          "untitled"
        ).replace(/[\/\\:*?"<>|]/g, "_");
        const dbPageDir = path.join(childDir, dbPageTitle);
        await syncPage(dbPage.id, dbPageDir);
      }
    } else if (block.type === "column_list" || block.type === "column") {
      // 컬럼 레이아웃 재귀 탐색
      const children = await retry(() => notion.blocks.children.list({ block_id: block.id }));
      await processBlocks(children.results, dirPath);
    }
  }
}

async function syncPage(pageId, dirPath) {
  if (!fs.existsSync(dirPath)) fs.mkdirSync(dirPath, { recursive: true });

  const title = await getTitle(pageId);
  const mdBlocks = await retry(() => n2m.pageToMarkdown(pageId));
  const mdContent = n2m.toMarkdownString(mdBlocks);

  const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
  const filePath = path.join(dirPath, fileName);
  fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
  console.log(`✅ 저장: ${filePath}`);

  let cursor = undefined;
  while (true) {
    const response = await retry(() => notion.blocks.children.list({
      block_id: pageId,
      start_cursor: cursor,
      page_size: 100,
    }));

    await processBlocks(response.results, dirPath);

    if (!response.has_more) break;
    cursor = response.next_cursor;
  }
}

async function sync() {
  console.log("🔄 Notion 동기화 시작...");
  await syncPage(process.env.NOTION_DATABASE_ID, "docs");
  console.log("🎉 동기화 완료!");
}

sync().catch((err) => {
  console.error("❌ 오류 발생:", err);
  process.exit(1);
});
