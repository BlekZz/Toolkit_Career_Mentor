# skill-v2-eval [ACTIVE]
- updated: 2026-09-02 (claude)
- base: ddcfe58
- 停點: 三情境實測 3/3 PASS（headless 實跑，證據與定義在 dev/Reference_eval_scenarios.md）；強化 1-4 全落地：回饋迴路（dev/Reference_feedback_loop.md）、Avoid_Risk 稽核 SOP（dev/runbooks/Workflow_avoid_risk_audit.md＋dev/Tracker_content_freshness.md）、D-10 作戰計畫模式（SKILL.md＋instructions.md §5.2）；部署已重建（含 career-mentor.zip）。
- 下一步: D-10 作戰計畫模式尚未實測——在 dev/Reference_eval_scenarios.md 加第 4 情境（開場說「從頭幫我準備求職」→ 驗提議進入模式＋B 完成後交接清單硬中斷）並跑一輪。
- 切入: dev/Reference_eval_scenarios.md、MainFiles/instructions.md §5.2、dev/Reference_feedback_loop.md
- 事實: [fact] 三情境 PASS 證據為 headless transcript（scratchpad transcripts/，session 結束即失效，摘錄已入 eval 文件）。[fact] deploy.ps1 入口用 Read-Host 互動選單，AI/headless 不可用——自動化一律直呼兩個子腳本（runbook 步驟⑤已註明）。
- 待裁: Avoid_Risk.md 引用的勞基法 22-1 條疑引錯條號（該條實際規範派遣勞工工資補充給付；試用期薪資剋扣應屬 21/22/26 條範疇）——修正屬內容變更，建議首次稽核（或立即派工查證）時處理。
