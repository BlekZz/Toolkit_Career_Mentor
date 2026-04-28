# Claude Web Skill — 使用說明

版本：v1 | 日期：2026-04-28

## 使用方式

### 方式一：Claude Projects（推薦）

1. 在 [claude.ai](https://claude.ai) 建立新 Project
2. 進入 Project Settings → **Project Instructions**
3. 貼上 `career-mentor-v1.skill` 的完整內容作為 Project Instructions
4. 儲存後，在該 Project 內開始對話即可啟用職涯履歷導師

### 方式二：直接貼入對話

1. 開啟新對話
2. 將 `career-mentor-v1.skill` 的完整內容貼入第一則訊息
3. 輸入 `開始` 啟動服務

## 文件說明

| 文件 | 說明 |
|------|------|
| `career-mentor-v1.skill` | 單一合併系統提示文件，包含所有服務模組（共 9 個 sections） |
| `USAGE.md` | 本使用說明（不需上傳） |

## 服務項目

啟動後，AI 會自動列出以下三項服務供選擇：

- **服務 A**：履歷檢視 + 優化建議 + 生成優化履歷
- **服務 B**：訪談萃取 + 編寫新工作經歷
- **服務 C**：職缺風險解剖 + 相性分析 + 面試準備

## 注意事項

- 所有對話均以繁體中文進行
- 建議使用 Claude Sonnet 4.6 或更高版本以確保最佳表現
- `.skill` 文件為純文字 Markdown 格式，可用任何文字編輯器開啟修改
