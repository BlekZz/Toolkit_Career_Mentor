# Reference — Career-Mentor Skill 現代化規範(2026-09 digest)

> 來源:(1) Anthropic 官方 skill authoring 文件與 spec 的網路 research(2026-09-02);(2) Gemini 3.1 Pro 對現有 SKILL.md 的獨立審查;(3) 本機 `~/.claude/dev/Reference_skill_authoring.md`(mattpocock 方法論)。三方發現已逐條裁定,本檔只留裁定後的結論。
> 用途:career-mentor skill v2 重寫的依據;重寫時逐條對照。
> 主要一手來源:[best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) · [spec](https://agentskills.io/specification) · [Claude Code skills](https://code.claude.com/docs/en/skills) · [支援文章:建立自訂 skill](https://support.claude.com/en/articles/12512198-creating-custom-skills) · [obra/superpowers](https://github.com/obra/superpowers)

---

## 1. 跨平台相容性紅線(Claude Code 為主、可打包上 claude.ai)

1. **Frontmatter 只用 6 個交集欄位**:`name`、`description`、`license`、`compatibility`、`metadata`、`allowed-tools`。claude.ai 上傳對 spec 外欄位(`argument-hint`、`disable-model-invocation`、`context` 等)**硬性報錯拒收**。Claude Code 專屬行為一律改在 body 內文表達。
2. **name 規則**:≤64 字元、小寫英數+連字號、必須與目錄名一致、不得含 "claude"/"anthropic"。`career-mentor` 合規,沿用。
3. **description 規則**:第三人稱(會注入 system prompt)、同時寫「做什麼+何時用+觸發關鍵詞」;spec 上限 1024 字元,但 claude.ai 支援文章寫 200——**保守取 ≤200 字元**。不要把 `/career-mentor` 這種呼叫方式寫進 description(那是系統層註冊,不是語意觸發資訊)。
4. **不依賴 Claude Code 專屬機制**:`$ARGUMENTS`、dynamic context injection、`context: fork` 在 claude.ai 不作用或導致上傳失敗。

## 2. 結構規範(progressive disclosure)

5. **SKILL.md body ≤500 行 / <5000 tokens**(官方明定最佳效能區)。SKILL.md 只放:核心 persona + 全域紀律 + 服務路由表 + 按需載入指引。**廢除「依序載入全部 10 份文件」設計**——那是 GPTs 時代的全量載入思維,會造成注意力稀釋(選 A 的使用者被迫載 18.9KB 的 Avoid_Risk)。
6. **三層架構**:L1 frontmatter(常駐 ~100 tokens)→ L2 SKILL.md body(觸發時載)→ L3 `references/`(用到才讀,未讀零成本)。拆檔判準:**互斥或很少同時用到的 context 才拆**——A/B/C 三服務正是教科書案例。
7. **引用只准一層深**:所有 reference 檔直接從 SKILL.md(或流程檔的明示步驟)連結;巢狀引用會誘發 `head -100` 偷讀不完整。**>100 行的 reference 檔開頭放 TOC**(Avoid_Risk、Special_Cases、examples 檔都適用)。
8. **SSOT 修復**:「履歷 8 區塊定義」目前同時存在於 instructions.md 與 Resume_Template.md——抽離,只留 Resume_Template.md 一處;instructions.md 純化為 persona + 全域規則 + 路由。
9. **Few-shot 範例(28.3KB)按服務拆三檔**:`examples_a.md` / `examples_b.md` / `examples_c.md`,各留 2-3 個最強 input/output 對照、刪解釋性文字、加 TOC,由各服務流程檔在「產出前」一步明示讀取。全載與 28KB 單檔原樣保留都是反模式(官方:「Claude 已經很聰明」,只留輸出品質確實依賴的範例)。

## 3. Persona 型多輪對話 skill 的特殊規範

(這類 skill 無社群公認標準;以下為官方機制事實 + superpowers `brainstorming` 範本 + Gemini 審查的裁定合成)

10. **多輪硬中斷(CRITICAL,新增)**:body 前段明寫「向使用者提問或要求確認後,**必須立即停止生成等待真實輸入**;絕不可預測或代替使用者回答來推進步驟」。現代模型推理連續性強,缺這條會把多輪訪談壓縮成單次獨白——對 Service B(蘇格拉底訪談)是致命的。
11. **一次一問**(抄 superpowers):訪談流程每輪只問一個問題;每階段設 approval gate。
12. **常駐規則放 body 最前段且極精簡**:Claude Code 的 compaction 只保留每個 skill 最近一次 invocation 的前 5000 tokens——語氣/「您」稱謂/拒答句這些「每輪都要生效」的規則必須在最前面;流程細節推到 references/。
13. **狀態追蹤用 checklist 模式**(官方認可):讓模型在回覆中維護「目前:服務 X 第 N/M 步」的可見進度——防跳步,且天然抗 compaction(checklist 留在對話近端)。
14. **抗漂移 = 重新讀檔,不是「清除記憶」**:context 無法清除,「拋棄舊知識」類指令無效力(駁回 Gemini 原措辭)。可執行的形式:切換服務或長對話後,把「重新讀取 `references/Service_X.md`」寫成流程步驟——L3 每次讀都是全新完整內容,天然抗漂移。
15. **Fast-track 開場**:使用者初次發言已明確表達需求(如直接附履歷要求優化)→ 跳過問候選單,直入對應服務;僅在意圖不明時走「問候→問稱呼→問求職階段→推薦服務」全流程。

## 4. 流程與品質規範

16. **每個步驟以可檢核的 completion criterion 收尾**(本機方法論 §3):「使用者已明確確認」優於「與使用者確認」。
17. **Evaluation-driven**(官方):重寫後建 3 個測試情境(各服務一個)實測觸發與流程遵循,再迭代;不憑感覺驗收。
18. **服務路由表保留**現有的「主要/輔助參考文件」矩陣(設計正確),但把「載入」語意改為「進入該服務時才讀取」;Special_Cases.md 與 Glossary.md 改為條件觸發(偵測到特殊背景/術語疑慮才讀)。

## 5. claude.ai 部署現況事實(2026-09,更新入 deploy guide)

- 打包:ZIP,**skill 資料夾本身位於 ZIP 根部**(資料夾名 = skill name),必含 SKILL.md;解壓後 <30MB。
- 上傳:claude.ai → Settings → Skills → Create skill → Upload a skill;需啟用 code execution;上傳後可 toggle。
- 能見度:自訂 skill 僅個人可見(Enterprise 才有 org 共享)。
- Projects vs Skills:Skills = 按需載入的可重複程序(跨對話生效)——本專案的正解;Projects 可疊用(instructions 放 persona 精簡版當固定入口)。
- 三 surface 格式已統一於 agentskills.io spec,但 skill 本體不跨平台同步,各自上傳。

## 6. 值得參考的 repo(重寫時可回看)

| Repo | 拿什麼 |
|---|---|
| [anthropics/skills](https://github.com/anthropics/skills) | 官方 template 與 `package_skill.py`(打包驗證標準);document skills 是複雜 skill 的參考實作 |
| [obra/superpowers](https://github.com/obra/superpowers) | `brainstorming` = 多輪 Socratic 對話型 skill 最佳實踐孤例:一次一問、階段 approval gate、路徑分類表、反模式表、明確終態 |
| [takechanman1228/claude-persona](https://github.com/takechanman1228/claude-persona) | demo-first(完整 worked examples 錨定輸出風格)、templates/ 目錄慣例 |
