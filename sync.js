const { Client } = require("@notionhq/client");
const { NotionToMarkdown } = require("notion-to-md");
const fs = require("fs");
const path = require("path");

const notion = new Client({ auth: process.env.NOTION_TOKEN });
const n2m = new NotionToMarkdown({ notionClient: notion });

async function sync() {
  console.log("🔄 Notion 동기화 시작...");

  // docs 폴더 없으면 생성
  if (!fs.existsSync("docs")) fs.mkdirSync("docs");

  // Notion DB에서 페이지 목록 가져오기
  const response = await notion.databases.query({
    database_id: process.env.NOTION_DATABASE_ID,
  });

  console.log(`📄 총 ${response.results.length}개 페이지 발견`);

  for (const page of response.results) {
    // 페이지 제목 추출
    const title =
      page.properties?.Name?.title?.[0]?.plain_text ||
      page.properties?.제목?.title?.[0]?.plain_text ||
      "untitled";

    // Notion 페이지 → Markdown 변환
    const mdBlocks = await n2m.pageToMarkdown(page.id);
    const mdContent = n2m.toMarkdownString(mdBlocks);

    // 파일명 생성 (특수문자 제거)
    const fileName = title.replace(/[\/\\:*?"<>|]/g, "_") + ".md";
    const filePath = path.join("docs", fileName);

    // 파일 저장
    fs.writeFileSync(filePath, `# ${title}\n\n` + mdContent.parent);
    console.log(`✅ 저장 완료: ${fileName}`);
  }

  console.log("🎉 동기화 완료!");
}

sync().catch((err) => {
  console.error("❌ 오류 발생:", err);
  process.exit(1);
});
