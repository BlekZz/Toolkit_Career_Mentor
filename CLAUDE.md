# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a **career mentorship AI assistant knowledge base** written entirely in Traditional Chinese (繁體中文). It contains structured prompts and reference materials for a professional career coach AI persona. There is no code, build system, or test infrastructure.

## File Map

| File | Role |
|------|------|
| `instructions.md` | Master system prompt — persona, tone rules, conversation flow, service menu, resume generation principles, and resume content blocks |
| `Service_A.md` | Step-by-step flow for Service A (resume review + optimization + generation) |
| `Service_B.md` | Step-by-step flow for Service B (guided interview → craft new work experience) |
| `Service_C.md` | Step-by-step flow for Service C (resume–job match analysis + interview prep) |
| `Service_Interview.md` | 4-stage interview methodology (STAR framework) used by Service B |
| `Avoid_Risk.md` | Taiwan workplace red-flag guide used by Service C for toxic-company detection |
| `Resume_Template.md` | 8-block resume format specification — governs output structure for Services A and B |
| `Special_Cases.md` | Non-standard career situation handlers — employment gaps, atypical work, freelancers, fresh graduates, mid-to-senior-age job seekers (45+), and career-changers (cross-industry/cross-function) |
| `Few_Shot_Examples.md` | Output examples for all three services — reference for AI response structure and tone |
| `Glossary.md` | System-wide terminology standard — canonical terms, usage contexts, prohibited variants for all 4 term groups |

## System Behaviour (from `instructions.md`)

- **Language**: All output must be in 繁體中文.
- **Persona**: Professional career/resume mentor — calm, objective, no emotional encouragement.
- **Address**: Always use 「您」 for the user.
- **Out-of-scope refusal**: Respond with `【抱歉，您詢問的問題不在我職能的回答範疇内，請詢問我關於職涯履歷的相關問題。】`
- **Session flow**: Greet → ask name → ask job-search stage → recommend best service via 求職階段推薦邏輯 table → execute chosen service → offer follow-up or close.

## Three Services

**A — Resume Review & Optimization** (7 steps)
Reference files: `Service_A.md`, `Resume_Template.md`; edge case: `Special_Cases.md`
Goal: Assess existing resume against career goals; deliver specific improvement feedback; generate an optimized resume. After Chinese resume is confirmed, optionally produce English version.
Sub-service **A-1 (中翻英)**: if user already has a finalized Chinese resume and needs only English translation, fork at step 2 into A-1 — translate following English resume conventions, confirm, then end.

**B — Guided Interview → New Work Experience** (7 steps)
Reference files: `Service_B.md`, `Service_Interview.md`, `Resume_Template.md`; edge case: `Special_Cases.md`; limited: `Avoid_Risk.md` Ch.2 only
Goal: Use Socratic interviewing (STAR model) to surface the user's real work contributions, then write polished resume bullets from the transcript. Optionally produce a 60-sec oral script or longer outline. If illegal work conditions are mentioned, cite labor law briefly and return to interview flow.

**C — Resume–Job Match + Interview Training** (9 steps)
Reference files: `Service_C.md`, `Avoid_Risk.md` (full), `Service_Interview.md`
Goal: Analyse fit between resume and target job posting; flag legal/ethical red flags; evaluate trial-assignment reasonableness; prepare the user for expected interview questions and strategic questions to ask the employer.

## Resume Generation Rules (from `instructions.md`)

1. Exclude content unrelated to the application target.
2. Adjust writing style to match the target industry/role.
3. ATS-compatible language and optimized phrasing.
4. Avoid personal bias; keep information accurate.
5. Eliminate logical inconsistencies (role–content mismatch, timeline gaps, contradictions).
6. Infer personality from conversation history, not just self-description.
7. High relevance and specificity to the target role.
8. Data-driven, outcome-oriented (not responsibility-oriented).
9. Prioritise representative projects and work experience; use education/skills if experience is thin.
10. Keyword matching and professional terminology.
11. Highlight unique narrative and core strengths.
12. Concise, readable, narratively consistent.

## Resume Content Blocks

`自介 (Intro)` · `自傳 (Long Intro)` · `工作經歷 (Work Experience)` · `代表專案 (Key Projects)` · `工作技能 (Skills)` · `教育學歷 (Education)` · `性格特徵 (Traits)` · `期望待遇 (Expectation)`

## Editing Guidelines

- All files are in Markdown; preserve heading hierarchy and list structure.
- Keep all content in Traditional Chinese unless adding a structural label that appears only in this CLAUDE.md.
- When updating a service flow, edit only the relevant `Service_*.md` file; keep `instructions.md` as the single source of truth for persona and global rules.
- `Avoid_Risk.md` is a shared reference: Service C uses it in full; Service B uses only Ch.2 (illegal work conditions) — changes to other chapters do not affect Service B.
- `Service_Interview.md` is a shared reference — changes there affect Services B and C.
- When editing any file, follow canonical terms defined in `Glossary.md`. If you spot a prohibited variant (e.g. "STAR 原則", "職涯經歷"), replace it with the canonical form and note it in the commit.

---

## Active Agents
> Generated by /agent-setup. Re-run to update.

Only the agents listed below are active for this project.
All other agents in `~/.claude/agents/bench_*/` should be treated as inactive.

| Agent | File | Bench | Reason |
|-------|------|-------|--------|
| Recruitment Specialist | `recruitment-specialist.md` | `bench_agency-agents` | Direct domain match — resume evaluation, talent frameworks, Taiwan labor law compliance |
| Workflow Architect | `specialized-workflow-architect.md` | `bench_agency-agents` | Maps the multi-step branching flows for Services A/B/C including failure/recovery paths |
| ZK Steward | `zk-steward.md` | `bench_agency-agents` | Manages this interconnected knowledge base — atomic notes, cross-file linking, validation |
| Book Co-Author | `marketing-book-co-author.md` | `bench_agency-agents` | Turns fragments into structured first-person narratives; ideal for resume 自介/自傳 sections |
| Document Generator | `specialized-document-generator.md` | `bench_agency-agents` | Produces the final PDF/DOCX resume output required by Service A |
| Corporate Training Designer | `corporate-training-designer.md` | `bench_agency-agents` | Interview coaching methodology and instructional design for Service B/C flows |
| Technical Writer | `engineering-technical-writer.md` | `bench_agency-agents` | Keeps reference `.md` files clear, accurate, and consistently structured |
| Feedback Synthesizer | `product-feedback-synthesizer.md` | `bench_agency-agents` | Synthesizes user session feedback to improve service prompts iteratively |
| Cultural Intelligence Strategist | `specialized-cultural-intelligence-strategist.md` | `bench_agency-agents` | Validates Taiwan-specific cultural accuracy in advice and workplace risk guidance |
| Content Creator | `marketing-content-creator.md` | `bench_agency-agents` | Resume copy quality — compelling, ATS-optimized, outcome-oriented phrasing |

## Inactive
All agents not listed above are suppressed for this session.
If you need an unlisted agent, explicitly name it in your message and reference its bench folder (`bench_agency-agents`).
