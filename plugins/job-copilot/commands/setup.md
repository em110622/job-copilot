---
description: Set up Job Co-Pilot for you. Asks a short set of questions about your search, your material, your tools, and your voice (proposing answers from your connected tools and files where it can), then writes your routing brain and memory. Run this once, first.
---

You are setting up **Job Co-Pilot** for a new user. Your job: create their personal routing brain and memory from the templates, filled in with their answers. This is the moment the system becomes theirs instead of generic.

## Ground rules
- Ask in small batches, not one giant form. Use AskUserQuestion.
- Every question has a sensible default or can be skipped. Nobody should stall.
- **Recommend, don't interrogate.** Wherever a tool or file is available, PROPOSE the answer from real signals (their CV, their LinkedIn profile, their email) and ask them to confirm or adjust. Only ask cold when you have nothing to propose.
- **Never assume their situation, market, or language.** Ask. A quiet search changes what is safe to do.
- This system is tool-agnostic. Ask what they use; never assume a specific tool.
- Write only to their chosen workspace folder. Show what you'll write before writing.
- The truth rule applies from the first minute: never fill a field they did not give you.

## Step 1 - Locate the workspace
Confirm the folder where their `CLAUDE.md`, `memory/`, and `applications/` should live. A fresh, empty folder is fine. If unclear, ask.

**Before writing anything, check for an existing setup.** If the folder already has a `CLAUDE.md` or a `memory/` folder, stop and tell the user. Do not overwrite it. Offer two options: point setup at a fresh folder, or walk through the existing `CLAUDE.md` together and fold Job Co-Pilot's routing table and memory files into it. Proceed only once they have chosen.

## Step 2 - Check what's connected
Note which relevant tools are available: email, a browser that can read LinkedIn, calendar, a document tool, and access to their files. You'll use them to propose answers and, at the end, to tell the user which workflows are live and which steps will be skipped. If a tool they rely on isn't connected, say how to connect it, or that the step is skipped until they do.

## Step 3 - Ask the setup questions (batched, propose-first)

**Your situation**
- Name? (propose from the account)
- Current or most recent title and employer?
- Location / timezone? [detect]
- Search situation? Options: actively searching full-time / employed and searching quietly / passive, open to offers.
- If quiet: who must not find out, and anything that must stay private? (record as discretion notes)
- Availability or notice period? [optional]

**Your market and language**
- Which market(s) are you applying in? (countries or regions; remote / hybrid / on-site)
- Which languages do you apply in? And which language are your records in (your current CV)?

**What you're looking for** [all optional, refine later]
- Target roles and seniority?
- Industries or named target companies?
- Must-haves, deal-breakers?

**Your material** (this is the most valuable batch)
- Where is your current CV? Any LinkedIn export (or profile URL), old applications, performance reviews, or project descriptions? Ask for paths or attachments.
- If they share a CV: read it and **propose the employment and forløb skeleton** for `experience.md` (titles, periods, and the records you can see, in their own format and language). Copy only what is in the source. Do not improve wording yet; that is the experience-coach's job, with them.
- References: if their CV names references, list them and ask which have agreed to be a reference (record consent in `contacts.md`).

**Your output format**
- How should tailored CVs and cover letters come out? Options: an editable doc (exports to Word/PDF), a Word file from your own template (ask for the template path), Markdown files in the application folder, or PDF.

**Your tools** (for each: name the tool, or "none")
- Email? [e.g. Gmail, Outlook]
- Browser for LinkedIn and research? [e.g. Claude in Chrome, the built-in browser, none]
- Calendar? [optional]
- How often do you want follow-ups surfaced, and after how many working days without reply should something count as waiting? [twice a week, 7 working days]

**Your voice** [all optional]
- General tone? How do you talk about your own results (modest or direct)?
- Anything you never do in writing?
- Paste 1 to 3 real things you've written: ideally a cover letter you were happy with and a LinkedIn post or message.

## Step 4 - Write the files and create the folders
Copy the plugin's templates into the workspace and fill them from the answers. Create the full structure up front so nothing fails later:
- `CLAUDE.md` from `templates/CLAUDE.md` (adjust tool references to their stack; keep the hard rules and the routing table).
- `memory/profile.md`, `memory/experience.md`, `memory/stories.md`, `memory/targets.md`, `memory/contacts.md`, `memory/tools.md`, `memory/voice.md`, `memory/decisions.md` from `templates/memory/`, filled with their answers. Leave blanks where they skipped; do not invent anything.
- Create empty so every workflow has a home: `applications/`, `memory/state/`, `memory/context-gaps.md`, `memory/context-watchlist.md`, `memory/skill-improvements.md`, and `memory/_backups/`.
- Write `memory/.jcp-version` containing the plugin's current version string (from `.claude-plugin/plugin.json`), the baseline for the "what's new" notice.
- If the workspace is a git repository, check that `memory/` and `applications/` are git-ignored, and tell the user if they are not (these hold personal data).

Show the user exactly what you're about to write (a short summary per file), then write on their confirmation.

## Step 5 - Show the memory and point to the next steps
Show them their memory so it feels real, one line per file, drawn only from their answers:
```
Here's what I've got so far. This is your memory, it lives in your folder, and it grows as we work.
- You: [name], [title], [situation], [timezone]
- Market and language: [markets] · applying in [languages]
- Looking for: [roles] · deal-breakers: [..]
- Experience: [N] employments, [M] forløb recorded · [K] with results filled in
- Output: [format]
- Tools: [connected] · [skipped]
- Voice: [tone] · [never-dos]
You can change any of this anytime by just telling me.
```
Show blanks as "not set yet". Then tell them:
- The system is live; from now on Claude reads `CLAUDE.md` and loads the right memory automatically.
- **Next: run `experience-coach`** on your most important forløb. The clearer the value in your records, the better every application gets.
- Run `/job-copilot:first-run` to try each workflow once and calibrate.
- After that, name a workflow in any chat: `tailor-application` with a posting, `interview-prep` before an interview, `interview-debrief` right after, `mock-interview` to practice, `linkedin-writer` for messages and posts, `follow-ups` a couple of times a week, `sync` then `consolidate` to refresh memory, `self-improvement` now and then.
- Run these in a normal chat so they work on their machine with access to this folder.
