# 職涯履歷導師 — Claude Web Skill 部署指南

版本：v1.1 | 日期：2026-04-29

## 套件概述

本套件包含「職涯履歷導師」AI 技能的完整部署文件，支援多種 Claude 平台。
所有文件均為獨立自足，無需連接原始專案目錄即可部署。

---

## 套件文件結構

```
Claude Web Skill/
├── Claude_Web_Skill_README.md   ← 本說明文件（部署指南）
├── SKILL.md                     ← 多文件技能路由入口（Claude Code CLI 安裝用）
├── career-mentor-v1.skill       ← 合併版單一文件（Claude.ai 快速貼上用）
└── references/                  ← 知識庫文件（可直接從此資料夾選取上傳）
    ├── instructions.md          ← System Prompt — 角色、規則、路由
    ├── Service_A.md             ← 服務 A：履歷檢視與優化生成
    ├── Service_B.md             ← 服務 B：訪談萃取新工作經歷
    ├── Service_C.md             ← 服務 C：職缺風險解剖與面試訓練
    ├── Service_Interview.md     ← STAR 訪談方法論與面試題型框架
    ├── Avoid_Risk.md            ← 台灣職場風險知識庫
    ├── Resume_Template.md       ← 履歷 8 區塊格式規範
    ├── Special_Cases.md         ← 特殊情境處理（空窗期、非典型工作）
    └── Few_Shot_Examples.md     ← 三個服務的輸出示範
```

---

## 方式 A：Claude.ai Project + 多文件知識庫（推薦）

最完整的部署方式，各文件獨立管理，更新單一文件時只需重新上傳對應文件。

### 部署步驟

1. 前往 claude.ai → 建立新 Project（或進入現有 Project）
2. 進入 **Project Settings → Project Instructions**
3. 開啟 `references/instructions.md`，複製全部內容，貼入 Instructions 欄位
4. 在 **Project Knowledge** 區塊，逐一上傳以下 8 個文件（可直接從 `references/` 資料夾選取）：

   | 順序 | 文件 | 說明 |
   |------|------|------|
   | 1 | `Service_A.md` | 服務 A 步驟 |
   | 2 | `Service_B.md` | 服務 B 步驟 |
   | 3 | `Service_C.md` | 服務 C 步驟 |
   | 4 | `Service_Interview.md` | STAR 訪談框架 |
   | 5 | `Avoid_Risk.md` | 台灣職場風險知識庫 |
   | 6 | `Resume_Template.md` | 履歷格式規範 |
   | 7 | `Special_Cases.md` | 特殊情境處理 |
   | 8 | `Few_Shot_Examples.md` | 輸出示範 |

5. 儲存 Project，在 Project 內開始對話即可

> **注意**：`instructions.md` 貼入 Instructions 欄位；其餘 8 個文件上傳至 Knowledge。`Claude_Web_Skill_README.md` 和 `SKILL.md` 為說明/路由文件，不需上傳至 Knowledge。

---

## 方式 B：Claude.ai 快速貼上（單一合併文件）

適合快速部署或不想管理多個文件的使用場景。

### 部署步驟（作為 Project Instructions）

1. 開啟 `career-mentor-v1.skill`，複製全部內容
2. 建立新 Claude Project → Project Settings → Project Instructions → 貼入並儲存
3. 在 Project 內開始對話即可

### 部署步驟（作為對話首則訊息）

1. 開啟 `career-mentor-v1.skill`，複製全部內容
2. 貼入新對話的第一則訊息，發送後輸入「開始」啟動服務

---

## 方式 C：Claude Code CLI 技能安裝

安裝為 Claude Code 斜線指令技能，使用 `/career-mentor` 呼叫。

### 部署步驟

```bash
# 1. 建立技能目錄
mkdir -p ~/.claude/skills/career-mentor/references

# 2. 複製技能文件
cp SKILL.md ~/.claude/skills/career-mentor/
cp references/*.md ~/.claude/skills/career-mentor/references/
```

### 安裝後目錄結構

```
~/.claude/skills/career-mentor/
├── SKILL.md
└── references/
    ├── instructions.md
    ├── Service_A.md
    ├── Service_B.md
    ├── Service_C.md
    ├── Service_Interview.md
    ├── Avoid_Risk.md
    ├── Resume_Template.md
    ├── Special_Cases.md
    └── Few_Shot_Examples.md
```

### 使用方式

在 Claude Code 中輸入：

```
/career-mentor
```

---

## 服務項目

| 服務 | 說明 |
|------|------|
| A — 履歷檢視 + 優化 + 生成 | 分析現有履歷，提供結構化回饋，生成優化版本 |
| B — 訪談萃取 + 新工作經歷 | 透過 STAR 訪談挖掘工作亮點，轉化為履歷條目 |
| C — 職缺風險解剖 + 面試準備 | 分析職缺說明，評估履歷匹配程度，準備面試問答 |

---

## 維護：更新 career-mentor-v1.skill

`career-mentor-v1.skill` 是 9 個 `references/` 模組手動拼接的單一合併文件，每個模組對應一個 SECTION 區塊：

| SECTION | 對應文件 |
|---------|---------|
| SECTION 1: INSTRUCTIONS | `references/instructions.md` |
| SECTION 2: SERVICE_A | `references/Service_A.md` |
| SECTION 3: SERVICE_B | `references/Service_B.md` |
| SECTION 4: SERVICE_C | `references/Service_C.md` |
| SECTION 5: SERVICE_INTERVIEW | `references/Service_Interview.md` |
| SECTION 6: AVOID_RISK | `references/Avoid_Risk.md` |
| SECTION 7: RESUME_TEMPLATE | `references/Resume_Template.md` |
| SECTION 8: SPECIAL_CASES | `references/Special_Cases.md` |
| SECTION 9: FEW_SHOT_EXAMPLES | `references/Few_Shot_Examples.md` |

**更新步驟**（任一 `references/` 文件有變更時）：
1. 開啟 `career-mentor-v1.skill`，找到對應 SECTION 的邊界（`==================================================================`）
2. 將 SECTION 標題行下方的全部內容替換為更新後的 `references/` 文件內容
3. 確認下一個 SECTION 的 `==================================================================` 分隔線仍完整保留

> **注意**：每次 `references/` 有更新，若使用方式 B（快速貼上）部署，必須同步更新 `career-mentor-v1.skill`，否則兩者內容將不同步。

---

## 注意事項

- 所有對話均以繁體中文進行
- 建議使用 Claude Sonnet 4.6 或更高版本以確保最佳表現
