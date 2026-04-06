const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

async function getTitle(pageId) {
  const page = await notion.pages.retrieve({ page_id: pageId });
  return (
    page.properties?.title?.title?.[0]?.plain_text ||
    page.properties?.Name?.title?.[0]?.plain_text ||
    "untitled"
  );
}

async function syncPage(pageId, dirPath) {
  if (!fs.existsSync(dirPath)) fs.mkdirSync(dirPath, { recursive: true });

  const title = await getTitle(pageId);
  const mdBlocks = await n2m.pageToMarkdown(pageId);
  const mdContent = n2m.toMarkdownString(mdBlocks);

  const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
  const filePath = path.join(dirPath, fileName);
  fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
  console.log(`✅ 저장: ${filePath}`);

  let cursor = undefined;
  while (true) {
    const response = await notion.blocks.children.list({
      block_id: pageId,
      start_cursor: cursor,
      page_size: 100,
    });

    for (const block of response.results) {
      if (block.type === "child_page") {
        // 직접 포함된 하위 페이지
        const childTitle = block.child_page.title.replace(/[\/\\:*?"<>|]/g, "_");
        const childDir = path.join(dirPath, childTitle);
        await syncPage(block.id, childDir);

      } else if (block.type === "link_to_page" && block.link_to_page?.page_id) {
        // 링크로 삽입된 페이지 ← 이게 핵심 추가!
        const linkedPageId = block.link_to_page.page_id;
        const linkedTitle = (await getTitle(linkedPageId)).replace(/[\/\\:*?"<>|]/g, "_");
        const childDir = path.join(dirPath, linkedTitle);
        await syncPage(linkedPageId, childDir);

      } else if (block.type === "child_database") {
        const childTitle = (block.child_database.title || "database").replace(/[\/\\:*?"<>|]/g, "_");
        const childDir = path.join(dirPath, childTitle);
        if (!fs.existsSync(childDir)) fs.mkdirSync(childDir, { recursive: true });
        console.log(`📊 DB 폴더 생성: ${childDir}`);
      }
    }

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
