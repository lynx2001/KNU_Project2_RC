const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

async function sync() {
  console.log("🔄 Notion 동기화 시작...");

  if (!fs.existsSync("docs")) fs.mkdirSync("docs");

  const pageId = process.env.NOTION_DATABASE_ID; // 변수명 재사용

  // 페이지 제목 가져오기
  const page = await notion.pages.retrieve({ page_id: pageId });
  const title =
    page.properties?.title?.title?.[0]?.plain_text ||
    page.properties?.Name?.title?.[0]?.plain_text ||
    "untitled";

  // 페이지 내용 → Markdown 변환
  const mdBlocks = await n2m.pageToMarkdown(pageId);
  const mdContent = n2m.toMarkdownString(mdBlocks);

  const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
  const filePath = path.join("docs", fileName);

  fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
  console.log(`✅ 저장 완료: ${fileName}`);

  console.log("🎉 동기화 완료!");
}

sync().catch((err) => {
  console.error("❌ 오류 발생:", err);
  process.exit(1);
});
