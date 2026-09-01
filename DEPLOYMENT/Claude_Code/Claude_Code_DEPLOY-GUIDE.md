# 職涯履歷導師 — Claude Code Skill 部署指南

版本:v2.0 | 日期:2026-09-02
變更:skill 升級 progressive-disclosure v2(SKILL.md 骨架化、Few_Shot_Examples 拆為 Examples_A/B/C、SKILL.md 源改為 `MainFiles/SKILL.md` 跨平台共用)。重寫規範見 `dev/Reference_skill_modernization.md`。

## 套件概述

本套件為「職涯履歷導師」Claude Code skill。安裝後可用 `/career-mentor` 啟動,或在對話提及履歷/職涯需求時自動觸發。SKILL.md 僅承載 persona、全域紀律與服務路由(~60 行常駐);知識庫文件於進入對應服務時按需載入。

## 套件文件結構

```
output/
├── SKILL.md                     ← 技能入口:persona + 紀律 + 路由(常駐)
└── references/                  ← 按需載入知識庫
    ├── instructions.md          ← 全域細則:求職階段推薦邏輯、12 原則、邊界情況
    ├── Glossary.md              ← 全系統術語規範
    ├── Service_A.md             ← 服務 A 七步驟(含 A-1 中翻英支線)
    ├── Service_B.md             ← 服務 B 七步驟(訪談萃取)
    ├── Service_C.md             ← 服務 C 九步驟(含內建三類題型框架)
    ├── Service_Interview.md     ← STAR 四階段訪談法 + 訪談紀律(唯一權威處)
    ├── Avoid_Risk.md            ← 台灣職場風險知識庫(C 全用;B 限 Ch.2)
    ├── Resume_Template.md       ← 履歷 8 區塊唯一權威定義 + 格式規範
    ├── Special_Cases.md         ← 特殊情境(條件觸發)
    ├── Examples_A.md            ← 服務 A 輸出示範(輸出前讀)
    ├── Examples_B.md            ← 服務 B 輸出示範(輸出前讀)
    └── Examples_C.md            ← 服務 C 輸出示範(輸出前讀)
```

## 重新產生 output/

任何 `MainFiles/*.md` 變更後,執行:

```powershell
& .\SCRIPT\deploy_claude_code.ps1
```

腳本以 `MainFiles/SKILL.md` 為 skill 入口源、其餘 `MainFiles/*.md` 進 `references/`(排除 SKILL.md 本身)。

## 安裝步驟

```powershell
# 專案級(建議:project-based 原則)
Copy-Item output -Destination <project>\.claude\skills\career-mentor -Recurse

# 或全域
Copy-Item output -Destination ~\.claude\skills\career-mentor -Recurse
```

安裝後新開 session 生效。使用:`/career-mentor`,或直接提出履歷/職涯需求。

## 注意事項

- 所有對話均以繁體中文進行
- frontmatter 僅使用跨平台交集欄位(name/description),與 claude.ai 上傳格式完全相容——同一份 output 也可交給 `SCRIPT\deploy_claude_web.ps1` 打包上傳 claude.ai
