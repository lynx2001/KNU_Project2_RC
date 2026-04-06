const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

async function getTitle(page) {
  return (
    page.properties?.title?.title?.[0]?.plain_text ||
    page.properties?.Name?.title?.[0]?.plain_text ||
    "untitled"
  );
}

async function syncPage(pageId, dirPath) {
  if (!fs.existsSync(dirPath)) fs.mkdirSync(dirPath, { recursive: true });

  const page = await notion.pages.retrieve({ page_id: pageId });
  const title = await getTitle(page);
  const mdBlocks = await n2m.pageToMarkdown(pageId);
  const mdContent = n2m.toMarkdownString(mdBlocks);

  const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
  const filePath = path.join(dirPath, fileName);
  fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
  console.log(`✅ 저장: ${filePath}`);

  // 하위 블록 전체 가져오기 (페이지 100개까지)
  let cursor = undefined;
  while (true) {
    const response = await notion.blocks.children.list({
      block_id: pageId,
      start_cursor: cursor,
      page_size: 100,
    });

    for (const block of response.results) {
      // child_page 타입
      if (block.type === "child_page") {
        const childTitle = block.child_page.title.replace(/[\/\\:*?"<>|]/g, "_");
        const childDir = path.join(dirPath, childTitle);
        await syncPage(block.id, childDir);
      }
      // child_database 타입 (표 형태)
      else if (block.type === "child_database") {
        const childTitle = block.child_database.title.replace(/[\/\\:*?"<>|]/g, "_") || "database";
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
