# 職涯履歷導師 — Claude Web (claude.ai) 部署指南

版本:v2.0 | 日期:2026-09-02
變更:claude.ai 已原生支援 Skills 上傳(ZIP),取代舊版「貼入 Project Instructions」作法;舊方式降級為備援。部署事實依據見 `dev/Reference_skill_modernization.md` §5。

---

## 方式 A:claude.ai 原生 Skills 上傳(推薦)

claude.ai 現已支援與 Claude Code 相同格式的 Agent Skills(SKILL.md + 附屬文件),按需載入、跨所有對話與 Project 生效。這是 GPTs/Gems 的直接替代形態。

### 打包規則

- ZIP 檔的**根部必須是 skill 資料夾本身**(資料夾名 = `career-mentor`,與 frontmatter `name` 一致),不是散檔在根部
- 資料夾內必含 `SKILL.md`,附屬文件放 `references/`
- 解壓後總大小 <30MB(本套件約 150KB,毫無壓力)
- frontmatter 只能用 spec 交集欄位(`name`/`description`/`license`/`compatibility`/`metadata`/`allowed-tools`);spec 外欄位會導致**上傳被拒**
- `description` 保守控制在 200 字元內(claude.ai 支援文章的上限;spec 為 1024)

### 打包指令

```powershell
# 於專案根執行——重建 output/ 並產出 career-mentor.zip
& .\SCRIPT\deploy_claude_web.ps1
```

### 上傳步驟

1. claude.ai → **Settings → Skills**(需已啟用 code execution / file creation 能力)
2. **Create skill → Upload a skill** → 選取 `career-mentor.zip`
3. 上傳後在 Skills 清單將其 toggle 為啟用
4. 任一對話中提及履歷/職涯需求即自動觸發,或直接說「使用 career-mentor」

### 已知限制

- 自訂 skill **僅上傳者本人可見**(Enterprise 方案才有組織共享);要分享給他人,把 ZIP 檔傳給對方各自上傳
- skill 本體不跨平台同步:claude.ai 與 Claude Code 各自持有一份,更新時兩邊都要重新部署

---

## 方式 B:Claude.ai Project 疊用(選用)

Skills 與 Projects 可以疊用。若想要一個「開場即進入導師 persona」的固定入口:

1. 建立 Project,Instructions 只放 **persona 精簡版**(角色、語氣、繁體中文、「您」稱謂)+ 一句「處理職涯履歷需求時使用 career-mentor skill」
2. 知識庫文件**不需**上傳至 Project Knowledge——skill 的 `references/` 已按需載入

> 舊版「instructions.md 貼入 Instructions + 9 檔上傳 Knowledge」的全量做法已淘汰:Project Knowledge 是常駐載入,會稀釋注意力且無法按服務分支載入。

---

## Claude Code CLI 安裝(主要形態)

```powershell
# 專案級安裝(建議)
Copy-Item SKILL.md <project>\.claude\skills\career-mentor\
Copy-Item references <project>\.claude\skills\career-mentor\references -Recurse

# 或全域安裝
Copy-Item SKILL.md ~\.claude\skills\career-mentor\
Copy-Item references ~\.claude\skills\career-mentor\references -Recurse
```

使用:`/career-mentor`,或對話中提及履歷/職涯需求時自動觸發。

---

## 服務項目

| 服務 | 說明 |
|------|------|
| A — 履歷檢視 + 優化 + 生成 | 分析現有履歷,提供結構化回饋,生成優化版本 |
| B — 訪談萃取 + 新工作經歷 | 透過 STAR 訪談挖掘工作亮點,轉化為履歷條目 |
| C — 職缺風險解剖 + 面試準備 | 分析職缺說明,評估履歷匹配程度,準備面試問答 |

---

## 版本沿革

- v2.0(2026-09-02):skill 內容依 `dev/Reference_skill_modernization.md` 重寫為 progressive-disclosure v2;部署改走 claude.ai 原生 Skills ZIP 上傳;汰除 `career-mentor-v1.skill` 合併檔與 per-platform SKILL.md(源統一為 `MainFiles/SKILL.md`)。
- v1.2(2026-05-14):GPTs/Gems 時代設計,Project Instructions 貼上法。
