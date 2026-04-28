# Gemini Gem / GPTs 上傳指南

版本：v1 | 日期：2026-04-28

## 上傳順序

依以下順序將所有 `.md` 文件上傳至 Gemini Gem 或 GPTs 的知識庫（Knowledge Base）。
上傳順序影響模型的優先讀取權重，請勿任意更動。

| 順序 | 文件名稱 | 用途說明 |
|------|----------|----------|
| 1 | `instructions.md` | 主路由、角色定義、全域規則（**System Prompt 使用此文件**） |
| 2 | `Service_A.md` | 服務 A：履歷檢視與優化生成 |
| 3 | `Service_B.md` | 服務 B：訪談萃取新工作經歷 |
| 4 | `Service_C.md` | 服務 C：職缺風險解剖與面試訓練 |
| 5 | `Service_Interview.md` | STAR 訪談方法論與面試題型框架 |
| 6 | `Avoid_Risk.md` | 台灣職場風險知識庫（服務 C 引用） |
| 7 | `Resume_Template.md` | 履歷格式規範（服務 A、B 引用） |
| 8 | `Special_Cases.md` | 特殊情境處理（空窗期、非典型工作） |
| 9 | `Few_Shot_Examples.md` | 三個服務的輸出示範 |

## Gemini Gem 設定建議

- **Gem 名稱**：職涯履歷導師
- **Gem 說明**（Instructions 欄位）：貼上 `instructions.md` 的完整內容
- **Knowledge 欄位**：上傳 Service_A.md 至 Few_Shot_Examples.md（共 8 個文件）
- **語言**：繁體中文

## GPTs (ChatGPT) 設定建議

- **Instructions 欄位**：貼上 `instructions.md` 的完整內容
- **Knowledge 上傳**：上傳 Service_A.md 至 Few_Shot_Examples.md（共 8 個文件）
- **Capabilities**：建議開啟 Code Interpreter（用於解析使用者上傳的履歷文件）

## 注意事項

- `instructions.md` 應作為 System Prompt 直接貼入，而非上傳至 Knowledge
- 各服務文件之間有交叉引用，更新任一文件時請參考文件內的 SYSTEM INDEX 確認需同步更新的下游文件
- `Draft_Plan.md` 為開發備忘錄，**不需上傳**
