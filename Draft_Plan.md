# Draft Plan — 未來開發方向

本文件記錄 agent review 後識別的低優先級優化方向，供未來版本迭代參考。

---

## 已完成路由架構（v1.2 — 2026-05-14）

### 知識庫文件一覽

| 文件 | 角色 | 被引用方 |
|------|------|---------|
| `instructions.md` | 角色定義、全域規則、服務路由主控、求職階段推薦邏輯、狀態追蹤 | 所有服務 |
| `Service_A.md` | 服務 A 7 步驟流程（含 A-1 中翻英支線） | Service A |
| `Service_B.md` | 服務 B 7 步驟流程（含口頭版本製作、違法工作條件偵測） | Service B |
| `Service_C.md` | 服務 C 9 步驟流程（含試做題評估步驟） | Service C |
| `Service_Interview.md` | 4 階段 STAR 訪談方法論 + 面試題型框架 | Service B（執行訪談）、Service C（生成題目） |
| `Avoid_Risk.md` | 台灣職場紅旗知識庫、數位偵查工具清單、試做題邊界指引 | Service C（完整引用）、Service B（限 Chapter 2） |
| `Resume_Template.md` | 履歷 8 區塊格式規範 | Service A、Service B |
| `Special_Cases.md` | 空窗期、非典型工作、應屆生/實習生、中高齡（45歲以上）、轉職者（跨產業/跨職能）求職策略 | Service A（邊界觸發）、Service B（邊界觸發） |
| `Few_Shot_Examples.md` | 三個服務的輸出格式示範（完整 4 階段訪談 + 口頭版 + C 步驟 7–9） | 參考用（不執行） |
| `Glossary.md` | 全系統術語規範（履歷、工作經歷、STAR、服務動詞 4 組術語） | 所有文件（術語新增或漂移時更新） |

---

### 服務路由圖

```
使用者輸入
    │
    ▼
instructions.md（路由主控）
    │
    ├──► 服務 A — 履歷檢視 + 優化 + 生成
    │        主要：Service_A.md
    │        輔助：Resume_Template.md（輸出格式）
    │        邊界：Special_Cases.md（空窗期、非典型工作偵測時觸發）
    │        └─► A-1 支線（中翻英）：步驟 2 分叉，翻譯確認後即結束
    │
    ├──► 服務 B — 訪談萃取 + 新工作經歷
    │        主要：Service_B.md
    │        訪談方法：Service_Interview.md（STAR 4 階段執行）
    │        輔助：Resume_Template.md（條目輸出格式）
    │        邊界：Special_Cases.md（非典型工作或空窗期偵測時觸發）
    │        限定引用：Avoid_Risk.md Chapter 2（違法工作條件偵測）
    │
    └──► 服務 C — 職缺風險解剖 + 面試準備
             主要：Service_C.md
             風險庫：Avoid_Risk.md（JD 紅旗分析）
             題型框架：Service_Interview.md（生成面試題，不執行訪談）
```

---

### 跨服務串聯邏輯

| 串聯路徑 | 觸發條件 | 說明 |
|---------|---------|------|
| B → A | Service B 完成後，使用者希望生成完整履歷 | B 的訪談輸出（新工作條目）作為 A 的輸入素材 |
| C → A | Service C 分析出履歷缺口或匹配不足 | A 依 C 識別的缺口針對性補強對應區塊 |
| C → B | Service C 發現履歷無法呈現某段關鍵工作經歷 | 引導使用者進入 B 萃取該段經歷後，再回 A 生成 |
| 完整作戰序列 | 使用者從零開始準備應徵特定職位 | 建議順序：B（素材萃取）→ A（生成履歷）→ C（JD 匹配 + 面試準備） |

---

### 邊界條件與特殊路由

| 情境 | 偵測邏輯 | 處理方式 |
|------|---------|---------|
| 空窗期（3 個月以上未就業） | Service A/B 步驟收集資料時偵測 | 引入 Special_Cases.md 空窗期模組 |
| 非典型工作（自僱、外包、演講） | 工作性質描述中識別 | 引入 Special_Cases.md 非典型工作模組 |
| 職缺 JD 無法判斷（模糊/缺乏資訊） | Service C 步驟2評估時識別 | 向使用者補問關鍵資訊，或標記為「無法評估」 |
| 範疇外問題 | instructions.md 全域規則 | 固定回應：【抱歉，您詢問的問題不在我職能的回答範疇内，請詢問我關於職涯履歷的相關問題。】 |

---

## 領域擴展（使用者群體覆蓋）

### ✅ D-1 差異化使用者群體路徑（完成 — 2026-05-14）
已完成：所有核心差異化使用者群體的處理模組

- **應屆畢業生／實習生**：已新增至 `Special_Cases.md`，涵蓋技能等級基準聲明（三情境對照表）、學術經歷等值策略（課程專題/社團/競賽/交換）、實習職位特殊處理原則
- `Service_A.md` 步驟3 已更新：評級前強制聲明使用的評估基準
- **中高齡求職者（45 歲以上）**：已新增至 `Special_Cases.md §中高齡求職者策略`，涵蓋履歷時間軸策略、抗年齡刻板印象敘事框架（四差異化維度）、薪資期望錨定策略、科技能力自證策略、法律意識（就服法第 5 條）；AI 使用指引涵蓋 Service A 步驟 3 / Service B 步驟 3
- **轉職者（跨產業/跨職能）**：已新增至 `Special_Cases.md §轉職者跨領域求職策略`，涵蓋可遷移技能盤點框架（三步驟）、產業術語轉譯策略、技能缺口揭露策略、轉職動機包裝；AI 使用指引涵蓋 Service A 步驟 3/6 / Service B 步驟 3
- **自僱/創業後重返職場者**：已新增至 `Special_Cases.md §非典型工作呈現策略` 內的 `§自僱與創業後重返職場` 子節，涵蓋成果量化框架（四層次替代指標）、重返職場動機包裝、失敗中性化敘事
- `Service_A.md` 步驟3 / `Service_B.md` 步驟3：已新增中高齡和轉職者的觸發條件與 Special_Cases.md 引用

待完成（次版本）：
- **外籍工作者/歸國留學生**：台灣工作許可文件、海外學歷在台灣職場的呈現策略

---

### ✅ D-2 試做題/無償作業應對策略（完成 — 2026-05-14）
- `Avoid_Risk.md` Part IV 新增 Chapter 9「試做題與面試作業的邊界指引」：合理範疇評估表、詢問話術、自我保護措施、直接拒絕情境
- `Service_C.md` 插入新步驟7（條件執行，引用 Chapter 9）；原步驟7→8、8→9

---

### ✅ D-3 Service B 延伸：書面版 vs. 口述版差異化（完成 — 2026-05-14）
- `Service_B.md` 步驟5後插入新步驟6「口頭版本製作（選擇性）」
- 60 秒版提供完整口說稿；更長版提供大綱（段落順序 + 關鍵要點 + 邏輯銜接提示），不提供字稿

---

### ✅ D-4 雙語履歷策略（完成 — 2026-05-14）
- `Service_A.md` 步驟2：加入 A-1 支線分叉點（中翻英），主線用戶附加英文版提醒
- `Service_A.md` 步驟7：中文履歷確認後詢問是否需要英文版
- `instructions.md`：服務 A 說明加入 A-1 支線；嚴格規則7、路由規則、服務串聯建議同步更新

---

## 知識庫補強

### ✅ D-5 數位偵查工具清單補充（Avoid_Risk.md）（完成 — 2026-05-14）
- 新增三項偵查工具至 Chapter 6 表格：經濟部商業司查詢、LinkedIn 員工在職時間反向查詢、個資洩漏型假職缺識別
- 各工具標注【AI 可執行】或【AI 主動掃描】，附具體搜尋關鍵詞，直接引導 AI 執行搜尋
- Service_C.md 步驟 3 同步新增對應搜尋關鍵詞（公司登記、employee turnover）及平台（經濟部商業司）

---

### ✅ D-6 特定 JD 語言紅旗詞彙庫（完成 — 2026-05-14）
- 在 Avoid_Risk.md Part I Chapter 3 結尾新增「JD 語言紅旗速查表」（11 個詞彙 × 風險等級 + 建議面試驗證問題）
- AI 應用指引「掃描三維度」的「語氣與文化暗示」維度同步新增速查表引用
- Service_C.md 步驟 4 維度 2 明確標注對照 JD 語言紅旗速查表逐條掃描，確保觸發時機正確
- 四個發佈版本（Project materials / Claude Code Skill / Claude Web Skill / Gemini Gem）全部同步

---

## 系統品質提升

### ✅ D-7 全系統術語 Glossary（完成 — 2026-05-14）
- 新增 `Glossary.md`（四個平台各一份），覆蓋四個術語群組：
  - **履歷術語**：規範 履歷 / 履歷內容 / 履歷字串 / 履歷檔案 / 完整履歷
  - **工作經歷術語**：規範 工作經歷 / 新工作經歷 / 代表專案 / 工作條目（禁止：工作記錄、職涯經歷）
  - **STAR 框架術語**：統一為 STAR 框架（禁止：STAR 原則、STAR 方法論、STAR 模型）；定義 STAR 拆解 / STAR 故事 / STAR 骨架的場景差異
  - **服務動詞術語**：定義 生成 / 輸出 / 產出 的使用情境，防止混用
- 所有四份 `instructions.md` 的 System Index 加入 Glossary.md 索引列
- `CLAUDE.md` File Map 更新；Editing Guidelines 新增「依 Glossary.md 規範用詞」指引

---

### ✅ D-8 Few_Shot_Examples.md 內容擴充（完成 — 2026-05-14）
- Service A：新增自介 (Intro) 和代表專案 (Key Projects) 輸出示範區塊
- Service B：訪談示範改為完整 4 階段（新增階段一基準線、階段三提煉亮點、階段四總結收獲）；新增步驟6 口頭版示範（60秒口說稿 + 更長版大綱格式）
- Service C：新增步驟7（試做題評估）、步驟8（相性判斷 + 模擬面試題）、步驟9（詢問面試團隊問題）完整輸出示範

---

### ✅ D-9 Avoid_Risk.md 開放給 Service B 引用（完成 — 2026-05-14）
決策：開放，限定範圍為 Chapter 2（違法工作條件）
- `Avoid_Risk.md` AI 應用指引：新增引用範圍說明表（Service C 完整引用 / Service B 限定 Chapter 2）
- `Service_B.md` 步驟3：新增違法工作條件偵測觸發條件與處理原則
- `instructions.md` 路由規則：Service B 路由新增 Avoid_Risk.md Chapter 2 限定引用說明

---

### D-10 跨服務協作流程設計
目前三個服務模組設計上相互獨立，但實際求職流程需要跨模組協作：
「B 萃取素材 → 餵進 A 生成履歷 → 依 C 分析的 JD 調整版本」

目前的串聯建議（B→A、C相性偏低→A/B）只覆蓋部分路徑。建議長期設計一個「完整求職作戰計畫」服務模式，讓 AI 主動建議最優的服務使用順序。

---

### D-11 服務 D：求職推薦信撰寫模組

推薦信（Letter of Recommendation / Reference Letter）是求職流程的獨立文件需求，目前系統完全缺乏對應的步驟流程、格式規範與輸出示範。

開發範圍：

- **Service_D.md**：推薦信撰寫完整步驟（訪談使用者與推薦方的關係背景、確認推薦重點與應用場景、生成草稿、交付格式）
- **推薦信格式規範**：新增至 Resume_Template.md 或獨立文件，含台灣本地 vs. 外商格式差異、正式 vs. 非正式情境區分
- **Few_Shot_Examples.md 擴充**：至少 2 個推薦信範例（直屬主管推薦、跨部門同事推薦）
- **instructions.md 更新**：服務選單新增 D 項、服務路由規則同步更新

建議執行 agents：
- **Recruitment Specialist** — 定義台灣市場推薦信標準與常見應用場景
- **Technical Writer** — 撰寫 Service_D.md 步驟結構
- **Book Co-Author** — few-shot 範例的敘事品質與語氣校準

---

*本文件最後更新：2026-05-14*
*v1.1（2026-04-29）：agent review — Workflow Architect + Recruitment Specialist + Technical Writer*
*v1.2（2026-05-14）：D1（應屆生）、D2（試做題）、D3（口頭版）、D4（雙語履歷）、D8（Few-Shot 擴充）、D9（Avoid_Risk 開放 B）完成實作*
*v1.3（2026-05-14）：D7（全系統術語 Glossary）完成實作*
*v1.4（2026-05-14）：文件維護 — 知識庫表格補入 Glossary.md + 更新 Avoid_Risk.md 引用範圍；路由圖加入 A-1 支線 + Service B 限定引用；instructions.md 加入求職階段推薦邏輯；D5/D6 標題格式統一*
*v1.5（2026-05-14）：整合掃描修正（8 平行 agent 編輯後的跨文件一致性修正）— D1 補完（中高齡/轉職者/自僱 Special_Cases.md 模組）；Service_A.md + Service_B.md 步驟 3 新增中高齡/轉職者觸發條件指向 Special_Cases.md；instructions.md SYSTEM INDEX + Service B 參考檔案更新 Special_Cases.md 涵蓋範圍；Service_B.md 記憶協助模式 you→您 修正；CLAUDE.md Special_Cases.md 文件描述更新；Draft_Plan.md 知識庫表格補入新增節*
