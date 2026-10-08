---
name: self-improvement
description: The loop where the system learns from its own use. Compares the drafts it produced (cover letters, CVs, messages, thank-you notes) with what you actually sent, to learn your voice; spots repeatable workflows worth turning into skills or fixes; sweeps memory gaps; then applies the changes you approve. Walked through part by part, writes held to the end. Run it in a new chat whenever you want, e.g. every week or two.
---

## GUIDED DELIVERY - one part at a time (always)
Walk the user through the parts in the OUTPUT order as separate turns, each led by one plain intro line and ending with its question, then wait. Hold all writes to the end and apply only what the user approves.

## FORMATTING - lists, never paragraphs (always)

---

Read `memory/profile.md` and `memory/tools.md` first. Surface everything in this session. No em-dashes. Each phase is fault-isolated: if one errors, note it and continue.

Friction log: `memory/skill-improvements.md`. Entry format: `- YYYY-MM-DD | "<quote or diff summary>" | proposed change in one line | open`.

## PHASE 1 - Draft vs. sent (voice signals)
Window: since the last run (default 14 days). For each draft the co-pilot produced:
- **Application documents:** compare the drafts in each `applications/*/` folder with the final versions the user saved or sent (ask where the final lives if unclear).
- **Messages:** compare drafted emails and thank-you notes with what was actually sent (email sent folder, if connected); LinkedIn messages only if the user pastes what they sent.

Classify: NEVER SENT, SENT MATCHING (skip), SENT DIVERGED (a voice signal). For each diverged draft, name the pattern (e.g. "you cut every opening sentence", "you replaced 'I led' with 'I was responsible for'", "you always shorten Danish letters to under a page") and propose a `memory/voice.md` change or a friction-log entry. Also flag any edit that changed a fact: if the user corrected a claim, the forløb in `experience.md` may be wrong too.

## PHASE 2 - Skill-spotter
Look for (A) repeatable things the user did 2+ times by hand (e.g. "translate my CV for Swedish postings", "answer salary questions") and (B) friction with existing skills (corrections, redos, "why does it keep..."). For each: name, where spotted, the opportunity. Write (B) as proposed friction-log entries. Three sharp candidates beat seven vague ones.

## PHASE 2.5 - Memory gap sweep + triage
Invoke `memory-keeper` in weekly-sweep mode and present the pending queue in `memory/context-gaps.md` for triage, drift first (Ingest / Skip / Mute / Link). Also list the three thinnest forløb as `experience-coach` candidates.

## PHASE 3 - Apply approved diffs
Read every `open` entry in `memory/skill-improvements.md` (including ones deferred by the `improve` skill). Propose a concrete diff for each to the target file (`CLAUDE.md`, a memory file, or a user-owned skill). Bulk approve/reject. On approval, apply, flip the entry to `applied` (or `wontfix`), and add a dated changelog line. Changes to a skill shipped inside the plugin are logged as suggestions, not edited in place (a plugin update would overwrite them).

## OUTPUT - one part at a time
```
Self-Improvement - [date]
Draft vs. sent [ok/failed] · Skill-spotter [ok/failed] · Memory sweep [ok/failed] · Applier [ok/failed]

Voice corrections
- [pattern] - [where seen] - update voice.md?

Fact corrections
- [claim changed in a sent version] - update experience.md?

New skill candidates
- [name] - [what it'd automate] - build?

Improvement candidates
- [skill] - [the friction] - propose fix?

Ready-to-apply diffs
- [target] - [one-line diff] - apply?
```
Nothing written without explicit confirmation this run.
