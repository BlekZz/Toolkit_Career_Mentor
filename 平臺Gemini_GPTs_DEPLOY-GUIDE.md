# 職涯履歷導師 — Gemini Gem / GPTs 部署指南

版本：v1.1 | 日期：2026-04-29

## 套件概述

本套件包含「職涯履歷導師」在 Gemini Gem 和 ChatGPT GPTs 的完整部署文件。
所有文件均為獨立自足，可直接從本資料夾選取上傳，無需連接原始專案目錄。

---

## 套件文件結構

```
Gemini Gem/
├── Gemini_Gem_README.md    ← 本說明文件（部署指南）
├── UPLOAD_GUIDE.md         ← 上傳順序快速參考
├── instructions.md         ← System Prompt（貼入 Gem/GPT Instructions 欄位）
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

## Gemini Gem 部署步驟

### 1. 建立新 Gem

1. 前往 [gemini.google.com](https://gemini.google.com) → 左側選單 **Gems** → **New Gem**（或 **建立 Gem**）
2. Gem 名稱設為：`職涯履歷導師`

### 2. 設定 Instructions（System Prompt）

1. 開啟本套件內的 `instructions.md`
2. 複製全部內容
3. 貼入 Gem 設定頁面的 **Instructions** 文字欄位

### 3. 上傳知識庫文件

在 **Knowledge** 欄位，點擊上傳按鈕，依序選取以下 8 個文件（可直接從本資料夾選取）：

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

> **注意**：`instructions.md` 貼入 Instructions 欄位，**不需要**另外上傳至 Knowledge。`Gemini_Gem_README.md` 和 `UPLOAD_GUIDE.md` 為說明文件，不需上傳。

### 4. 儲存並測試

點擊 **Save**（儲存）→ 在 Gem 對話框輸入「你好」確認正常啟動

---

## ChatGPT GPTs 部署步驟

### 1. 建立新 GPT

1. 前往 [chatgpt.com](https://chatgpt.com) → **Explore GPTs** → 右上角 **Create**
2. 切換至 **Configure** 頁籤

### 2. 設定基本資訊

- **Name**：`職涯履歷導師`
- **Description**：`專業的職涯履歷顧問，提供履歷分析優化（A）、工作經歷訪談萃取（B）、職缺風險解剖與面試訓練（C）三項服務。`

### 3. 設定 Instructions

1. 開啟 `instructions.md`，複製全部內容
2. 貼入 **Instructions** 文字欄位

### 4. 上傳知識庫文件

在 **Knowledge** 區塊點擊 **Upload files**，依序選取以下 8 個文件（可直接從本資料夾選取）：

`Service_A.md`、`Service_B.md`、`Service_C.md`、`Service_Interview.md`、`Avoid_Risk.md`、`Resume_Template.md`、`Special_Cases.md`、`Few_Shot_Examples.md`

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
- 更新任一知識庫文件時，需於 Gem/GPTs 設定頁面刪除舊版並重新上傳對應文件
- `Gemini_Gem_README.md` 和 `UPLOAD_GUIDE.md` 為說明文件，**不需上傳**至 Gem 或 GPTs
