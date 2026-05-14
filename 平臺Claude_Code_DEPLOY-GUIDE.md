# 職涯履歷導師 — Claude Code Skill 部署指南

版本：v1.1 | 日期：2026-04-29

## 套件概述

本套件為「職涯履歷導師」Claude Code CLI 技能。
安裝後可在 Claude Code 中使用 `/career-mentor` 指令啟動完整服務流程。
所有文件均為獨立自足，無需連接原始專案目錄。

---

## 套件文件結構

```
Claude Code Skill/
├── Claude_Code_Skill_README.md  ← 本說明文件（不需複製至技能目錄）
├── SKILL.md                     ← 技能路由入口（必要）
└── references/                  ← 知識庫文件（必要）
    ├── instructions.md          ← 角色定義、全域規則、路由邏輯
    ├── Service_A.md             ← 服務 A 步驟
    ├── Service_B.md             ← 服務 B 步驟
    ├── Service_C.md             ← 服務 C 步驟
    ├── Service_Interview.md     ← STAR 訪談方法論
    ├── Avoid_Risk.md            ← 台灣職場風險知識庫
    ├── Resume_Template.md       ← 履歷格式規範
    ├── Special_Cases.md         ← 特殊情境處理
    └── Few_Shot_Examples.md     ← 輸出示範
```

---

## 安裝步驟

### 步驟 1：建立技能目錄

```bash
mkdir -p ~/.claude/skills/career-mentor/references
```

### 步驟 2：複製文件

```bash
# 複製路由入口
cp SKILL.md ~/.claude/skills/career-mentor/

# 複製所有知識庫文件
cp references/*.md ~/.claude/skills/career-mentor/references/
```

### 步驟 3：確認目錄結構

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

### 步驟 4：啟動技能

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

## 注意事項

- `Claude_Code_Skill_README.md` 為說明文件，**不需**複製至技能目錄
- 所有對話均以繁體中文進行
- 技能路由由 `SKILL.md` 入口控制，知識庫統一位於 `references/` 子目錄
- 安裝完成後，Claude Code 重新啟動時會自動偵測新技能
