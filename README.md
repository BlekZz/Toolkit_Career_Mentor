# 職涯履歷導師 Career Mentor

> 專業職涯履歷 AI 助理 skill,提供履歷優化、工作經歷訪談萃取、職缺風險解剖與面試準備三大服務。
> 以 Agent Skill 形態部署:Claude Code(主要)+ claude.ai 原生 Skills(ZIP 上傳)。
> v2.0 起採 progressive-disclosure 架構(重寫規範:`dev/Reference_skill_modernization.md`)。

---

## 服務概覽

| 服務 | 說明 | 主要步驟 |
|------|------|---------|
| **A — 履歷檢視 + 優化 + 生成** | 評估現有履歷,提供具體回饋,生成 ATS 優化版本 | 7 步驟 |
| **A-1 — 中翻英支線** | 已有中文履歷,只需英文版,服務 A 步驟 2 分叉,翻譯確認後結束 | — |
| **B — 訪談萃取 + 新工作經歷** | 以 STAR 訪談挖掘真實貢獻,轉化為工作條目;可選製作 60 秒口頭版 | 7 步驟 |
| **C — 職缺風險解剖 + 面試準備** | 分析 JD 紅旗、評估履歷匹配度、試做題合理性,生成面試問答集 | 9 步驟 |

### 跨服務串聯建議

```
完整作戰序列:B(素材萃取)→ A(生成履歷)→ C(JD 匹配 + 面試準備)
```

---

## 專案結構

```
career-mentor/
├── CLAUDE.md                    ← AI 開發工作指引(不上傳至任何平臺)
├── Draft_Plan.md                ← 版本記錄與未來開發路線圖
├── dev/                         ← 開發文件(重寫規範、handoff)
│
├── MainFiles/                   ← 唯一知識庫來源(SSOT),部署產物均由此複製
│   ├── SKILL.md                 ← skill 入口(常駐):persona、全域紀律、硬中斷、路由
│   ├── instructions.md          ← 按需全域細則:推薦邏輯、12 原則、邊界情況
│   ├── Glossary.md              ← 全系統術語規範
│   ├── Service_A.md             ← 服務 A 步驟流程(含 A-1 中翻英支線)
│   ├── Service_B.md             ← 服務 B 步驟流程(含口頭版製作)
│   ├── Service_C.md             ← 服務 C 步驟流程(含試做題評估、內建三類題型框架)
│   ├── Service_Interview.md     ← STAR 4 階段訪談方法論 + 訪談紀律唯一權威
│   ├── Avoid_Risk.md            ← 台灣職場風險知識庫(Service C 完整引用 / B 限 Ch.2)
│   ├── Resume_Template.md       ← 履歷 8 區塊唯一權威定義 + 格式規範
│   ├── Special_Cases.md         ← 空窗期、非典型工作、應屆生、中高齡(45+)、轉職者
│   └── Examples_A/B/C.md        ← 各服務輸出示範(輸出前按需讀取)
│
├── DEPLOYMENT/                  ← 平臺部署資料夾(由 SCRIPT/ 管理)
│   ├── Claude_Code/
│   │   ├── Claude_Code_DEPLOY-GUIDE.md
│   │   └── output/              ← 部署產物(每次 deploy 完整重建)
│   │       ├── SKILL.md
│   │       └── references/
│   └── Claude_Web/
│       ├── Claude_Web_DEPLOY-GUIDE.md
│       ├── career-mentor.zip    ← claude.ai 原生 Skills 上傳檔(自動打包)
│       └── output/
│           ├── SKILL.md
│           └── references/
│
└── SCRIPT/                      ← 部署自動化腳本
    ├── deploy.ps1               ← 互動式入口
    ├── deploy_claude_code.ps1
    └── deploy_claude_web.ps1
```

> Gemini Gems 與 ChatGPT GPTs 版本已於 v2.0 淘汰(平臺退場);v1 產物保留於 git 歷史(commit `d7fe98b` 之前)。

---

## 部署流程

### 互動式部署(推薦)

```powershell
.\SCRIPT\deploy.ps1
```

依提示選擇平臺(1–2),腳本自動:清除 `output/` → 以 `MainFiles/SKILL.md` 為入口源、其餘文件複製進 `references/`;Claude Web 額外打包 `career-mentor.zip`(skill 資料夾位於 ZIP 根部,符合 claude.ai 上傳規格)。

### 直接執行平臺腳本

```powershell
.\SCRIPT\deploy_claude_code.ps1   # Claude Code
.\SCRIPT\deploy_claude_web.ps1    # Claude.ai Web(含 ZIP 打包)
```

### 各平臺部署方式

| 平臺 | 部署方式 | 參考文件 |
|------|---------|---------|
| **Claude Code** | 將 `output/` 複製至 `<project>/.claude/skills/career-mentor/`(或 `~/.claude/skills/`) | `Claude_Code_DEPLOY-GUIDE.md` |
| **Claude.ai** | Settings → Skills → Create skill → Upload → `career-mentor.zip` | `Claude_Web_DEPLOY-GUIDE.md` |

---

## 知識庫文件職責

| 文件 | 職責 | 下游依賴 |
|------|------|---------|
| `SKILL.md` | 常駐入口:persona、全域紀律、多輪硬中斷、狀態 checklist、服務路由、fast-track、條件觸發 | 所有文件 |
| `instructions.md` | 按需細則:求職階段推薦邏輯、服務說明、狀態追蹤細則、邊界情況、串聯建議、履歷生成 12 原則 | Service_A/B/C.md |
| `Glossary.md` | 四組術語規範(履歷 / 工作經歷 / STAR 框架 / 服務動詞),禁止替代用法 | 所有文件 |
| `Service_A.md` | 服務 A 7 步驟 + A-1 中翻英支線分叉邏輯 | Examples_A.md |
| `Service_B.md` | 服務 B 7 步驟 + 違法工作條件偵測 + 口頭版製作 | Examples_B.md |
| `Service_C.md` | 服務 C 9 步驟 + 試做題評估 + 內建三類題型框架 | Examples_C.md |
| `Service_Interview.md` | STAR 4 階段訪談方法論;訪談紀律(一次一問、停止等待、approval gate)唯一權威 | Service_B.md |
| `Avoid_Risk.md` | 台灣職場紅旗知識庫、JD 語言紅旗速查表、數位偵查工具清單、試做題邊界指引 | Service_C.md(完整)、Service_B.md(限 Ch.2) |
| `Resume_Template.md` | 履歷 8 區塊唯一權威定義(自介 / 自傳 / 工作經歷 / 代表專案 / 技能 / 教育 / 性格特徵 / 期望待遇)+ 格式規範 | Service_A.md、Service_B.md、Examples_A/B.md |
| `Special_Cases.md` | 空窗期、非典型工作、應屆生/實習生、中高齡(45+)、轉職者、自僱重返(條件觸發) | Service_A.md、Service_B.md |
| `Examples_A/B/C.md` | 各服務輸出示範(每檔 2-3 個最強對照),輸出前按需讀取 | — |

---

## 服務路由圖

```
使用者輸入
    │
    ▼
SKILL.md(常駐路由:fast-track 或問候推薦)
    │  進入服務時才讀取該線文件(progressive disclosure)
    │
    ├──► 服務 A — 履歷檢視 + 優化 + 生成
    │        讀取:Service_A.md、Resume_Template.md
    │        按需:Special_Cases.md(條件觸發)、Examples_A.md(輸出前)
    │        └─► A-1 支線(中翻英):步驟 2 分叉,翻譯確認後結束
    │
    ├──► 服務 B — 訪談萃取 + 新工作經歷
    │        讀取:Service_B.md、Service_Interview.md、Resume_Template.md
    │        按需:Special_Cases.md、Avoid_Risk.md Ch.2(違法偵測)、Examples_B.md
    │
    └──► 服務 C — 職缺風險解剖 + 面試準備
             讀取:Service_C.md、Avoid_Risk.md(全文)
             按需:Examples_C.md(題型框架內建於 Service_C 步驟 8)
```

---

## 更新知識庫

只需編輯 `MainFiles/` 內的對應文件,然後重新部署:

```powershell
.\SCRIPT\deploy_claude_code.ps1
.\SCRIPT\deploy_claude_web.ps1
```

> **重要**:`DEPLOYMENT/*/output/` 與 `career-mentor.zip` 是自動管理的產物,請勿直接編輯。
> 文件依賴變動時,同步更新 `MainFiles/instructions.md` 檔頭的 SYSTEM INDEX 表。

---

## 角色設定摘要

- **語言**:所有對話以繁體中文進行
- **稱謂**:對使用者一律稱「您」
- **語氣**:專業、平靜、客觀;無情緒鼓勵
- **範疇外拒絕**:`【抱歉,您詢問的問題不在我職能的回答範疇内,請詢問我關於職涯履歷的相關問題。】`

---

## 版本紀錄

| 版本 | 日期 | 主要變更 |
|------|------|---------|
| v1.0 | 2026-04-29 | 初始版本,服務 A / B / C 基礎流程 |
| v1.1 | 2026-04-29 | Agent review(Workflow Architect + Recruitment Specialist + Technical Writer) |
| v1.2 | 2026-05-14 | 應屆生模組、試做題評估、口頭版、雙語履歷(A-1)、Few-Shot 擴充、Avoid_Risk 開放 B Ch.2 |
| v1.3 | 2026-05-14 | 全系統 Glossary(四組術語規範) |
| v1.4 | 2026-05-14 | 中高齡 / 轉職者 / 自僱重返模組;JD 語言紅旗速查表;數位偵查工具清單 |
| v1.5 | 2026-05-14 | 跨文件一致性修正(8 個平行 agent 編輯後整合掃描) |
| v1.6 | 2026-05-15 | 專案架構重整:MainFiles + DEPLOYMENT + SCRIPT 三層架構;部署自動化腳本 |
| v2.0 | 2026-09-02 | Skill 現代化:SKILL.md 骨架化(progressive disclosure)、多輪硬中斷、Few-Shot 拆三檔、訪談紀律/8 區塊 SSOT 化;claude.ai 原生 Skills ZIP 部署;淘汰 Gemini Gems / ChatGPT GPTs |

---

## 待開發

- **D-10** — 完整求職作戰計畫:跨服務 B→A→C 串聯的主動引導模式
- **D-11** — 服務 D:求職推薦信撰寫模組(Service_D.md + 格式規範 + 輸出示範)
- **外籍工作者 / 歸國留學生**:台灣工作許可文件、海外學歷在台灣職場的呈現策略
- **實測評測集**:三情境驗收(fast-track / 訪談紀律 / 中途切換)常態化為每次改版的迴歸測試
