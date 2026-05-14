# 職涯履歷導師 — ChatGPT GPTs 部署指南

版本：v1.2 | 日期：2026-05-14

## 套件概述

本套件包含「職涯履歷導師」在 ChatGPT GPTs 的完整部署文件。
所有文件均位於 `output/` 資料夾，可直接從該資料夾選取上傳，無需連接原始專案目錄。

---

## 套件文件結構

```
output/
├── instructions.md         ← System Prompt（貼入 GPT Instructions 欄位）
├── Glossary.md             ← 全系統術語規範
├── Service_A.md            ← 服務 A：履歷檢視與優化生成
├── Service_B.md            ← 服務 B：訪談萃取新工作經歷
├── Service_C.md            ← 服務 C：職缺風險解剖與面試訓練
├── Service_Interview.md    ← STAR 訪談方法論與面試題型框架
├── Avoid_Risk.md           ← 台灣職場風險知識庫
├── Resume_Template.md      ← 履歷 8 區塊格式規範
├── Special_Cases.md        ← 特殊情境處理（空窗期、非典型工作）
└── Few_Shot_Examples.md    ← 三個服務的輸出示範
```

---

## ChatGPT GPTs 部署步驟

### 1. 建立新 GPT

1. 前往 [chatgpt.com](https://chatgpt.com) → **Explore GPTs** → 右上角 **Create**
2. 切換至 **Configure** 頁籤

### 2. 設定基本資訊

- **Name**：`職涯履歷導師`
- **Description**：`專業的職涯履歷顧問，提供履歷分析優化（A）、工作經歷訪談萃取（B）、職缺風險解剖與面試訓練（C）三項服務。`

### 3. 設定 Instructions

1. 開啟 `output/instructions.md`，複製全部內容
2. 貼入 **Instructions** 文字欄位

### 4. 上傳知識庫文件

在 **Knowledge** 區塊點擊 **Upload files**，依序選取以下 9 個文件（直接從 `output/` 資料夾選取）：

| 順序 | 文件 | 說明 |
|------|------|------|
| 1 | `Glossary.md` | 全系統術語規範（優先載入） |
| 2 | `Service_A.md` | 服務 A 步驟 |
| 3 | `Service_B.md` | 服務 B 步驟 |
| 4 | `Service_C.md` | 服務 C 步驟 |
| 5 | `Service_Interview.md` | STAR 訪談框架 |
| 6 | `Avoid_Risk.md` | 台灣職場風險知識庫 |
| 7 | `Resume_Template.md` | 履歷格式規範 |
| 8 | `Special_Cases.md` | 特殊情境處理 |
| 9 | `Few_Shot_Examples.md` | 輸出示範 |

> **注意**：`instructions.md` 貼入 Instructions 欄位，**不需要**另外上傳至 Knowledge。
> 本指引文件（`GPTs_DEPLOY-GUIDE.md`）為說明文件，不需上傳。

### 5. 設定功能選項

- **Capabilities** → 建議開啟 **Code Interpreter**（可解析使用者上傳的履歷文件）

### 6. 儲存並測試

點擊 **Save** → 在 Preview 對話框輸入「你好」確認正常啟動

---

## 服務項目

| 服務 | 說明 |
|------|------|
| A — 履歷檢視 + 優化 + 生成 | 分析現有履歷，提供結構化回饋，生成優化版本 |
| B — 訪談萃取 + 新工作經歷 | 透過 STAR 訪談挖掘工作亮點，轉化為履歷條目 |
| C — 職缺風險解剖 + 面試準備 | 分析職缺說明，評估履歷匹配程度，準備面試問答 |

---

## 注意事項

- 所有對話均以繁體中文進行
- 更新任一知識庫文件時，需於 GPTs 設定頁面刪除舊版並重新上傳對應文件
- 本指引文件（`GPTs_DEPLOY-GUIDE.md`）為說明文件，**不需上傳**至 GPTs
