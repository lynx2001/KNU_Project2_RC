const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

// 페이지 제목 가져오기
async function getTitle(page) {
  return (
    page.properties?.title?.title?.[0]?.plain_text ||
    page.properties?.Name?.title?.[0]?.plain_text ||
    "untitled"
  );
}

// 재귀적으로 페이지 + 하위 페이지 동기화
async function syncPage(pageId, dirPath) {
  // 폴더 생성
  if (!fs.existsSync(dirPath)) fs.mkdirSync(dirPath, { recursive: true });

  // 현재 페이지 내용 저장
  const page = await notion.pages.retrieve({ page_id: pageId });
  const title = await getTitle(page);
  const mdBlocks = await n2m.pageToMarkdown(pageId);
  const mdContent = n2m.toMarkdownString(mdBlocks);

  const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
  const filePath = path.join(dirPath, fileName);
  fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
  console.log(`✅ 저장: ${filePath}`);

  // 하위 블록 중 child_page 찾기
  const blocks = await notion.blocks.children.list({ block_id: pageId });
  for (const block of blocks.results) {
    if (block.type === "child_page") {
      const childTitle = block.child_page.title.replace(/[\/\\:*?"<>|]/g, "_");
      const childDir = path.join(dirPath, childTitle);
      await syncPage(block.id, childDir);  // 재귀 호출
    }
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
