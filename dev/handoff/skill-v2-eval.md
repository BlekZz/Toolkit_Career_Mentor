# skill-v2-eval [ACTIVE]
- updated: 2026-09-02 (claude)
- base: d7fe98b
- 停點: skill v2 重寫＋fresh-context 稽核修復＋部署管線同步已完成並 commit（83c790c、d7fe98b）；Gem/GPTs 已淘汰；claude.ai 上傳檔 `DEPLOYMENT/Claude_Web/career-mentor.zip` 已產出。唯一未做：實測評測（規範第 17 條 evaluation-driven）。
- 下一步: 把 `DEPLOYMENT/Claude_Code/output/` 裝進一個測試位置，跑三情境評測：①開場直接丟履歷（驗 fast-track 跳選單）②服務 B 訪談（驗一次一問＋提問後停止等待）③服務 B 中途轉 C（驗切換重讀＋資訊保留）。
- 切入: dev/Reference_skill_modernization.md（18 條規範，§4-17 評測要求）、MainFiles/SKILL.md、DEPLOYMENT/Claude_Code/Claude_Code_DEPLOY-GUIDE.md
- 事實: [fact] claude.ai 上傳 ZIP 需 skill 資料夾在根部——career-mentor.zip 已驗證結構正確（本 session ZipFile 列舉：career-mentor/SKILL.md…）。[fact] frontmatter 僅可用 6 欄交集，spec 外欄位 claude.ai 硬拒收（technotes claude-code-031）。[fact] 訪談紀律唯一權威在 MainFiles/Service_Interview.md 開頭（Service_B.md 只留 pointer，稽核修復 d7fe98b 前置 commit 83c790c）。
