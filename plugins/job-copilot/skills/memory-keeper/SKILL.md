---
name: memory-keeper
description: Keeps your memory current with the least effort from you. Two triggers. (1) Capture - at the end of a turn or on "remember this", it notices a durable new fact (a result, a contact, a story, a promise, a decision) and proposes a memory update. (2) Context - while reading a source (a posting, an email thread, a company page), it notices things named but unknown, and drift against what memory says, and queues or surfaces them. Propose-only; it never writes without your yes. Triggers on "remember this", "capture that", "what am I missing", or automatically end-of-turn when confidence is high.
---

# Memory Keeper

The co-pilot does a lot of work in a job search, but it does not automatically remember what it learns or notice its own blind spots unless told. This skill closes both gaps.

**Core principle: gate the write, not the read.** Reading is cheap and reversible; a memory edit needs the user's approval. Auto-read freely, never auto-write.

Memory lives in `memory/` next to `CLAUDE.md`, plus one folder per application in `applications/`. Route each fact using the routing table in `CLAUDE.md`.

---

## Trigger 1 - Capture (write-time)

Runs at the end of any turn (silently scoring for capture-worthy content) or on demand.

**The bar.** Fire only if the turn contains at least one of these, AND it is not already in the target file:

1. **A result or value fact** - a number, an effect, a starting point, the user's specific part in a forløb, said in passing ("oh, and that cut onboarding from two weeks to three days"). Routes to `memory/experience.md` (the forløb it belongs to). This is the most valuable capture; never let one slip.
2. **A story** - an example the user told well in conversation, a mock interview, or a debrief. Routes to `memory/stories.md`.
3. **A person** - a new recruiter, contact, interviewer, or a reference's consent. Routes to `memory/contacts.md`.
4. **A promise** - something the user or someone else promised to do, with a date. Routes to `memory/contacts.md` or the application's `posting.md`.
5. **A target or decision** - a changed must-have, a role declined, a positioning chosen. Routes to `memory/targets.md` or `memory/decisions.md`.
6. **A working-pattern or voice change** - how the user wants drafts to sound or the co-pilot to behave. Routes to `memory/voice.md` or `CLAUDE.md`.

**Skip:** opinions in flight, brainstorms, anything already in memory, and claims the user is unsure of (ask instead; never store a guess as a fact).

**On a fire:** surface a single line, for example `Worth capturing to memory/experience.md (forløb: <title>) - propose the diff?` On yes, show a surgical before/after and write only after confirmation. Add a dated changelog line. Confirm in one line: `Noted in memory/<file>.md: <fact>.`

---

## Trigger 2 - Context (read-time)

Runs while the co-pilot reads a source (a posting, an email thread, a company page, a LinkedIn profile).

**Track A - referenced things, unseen.** A posting links to a team page; a recruiter mentions a second role; an email refers to a case brief. Keep only what matters for an active application or a contact in memory. Auto-read the reachable ones; queue the rest in `memory/context-gaps.md` as `needs-link`.

**Track B - drift.** Something read contradicts memory: a contact changed jobs, a company reorganised, a posting was updated, the user's LinkedIn profile says something different from `experience.md`. Mark it `drift` and surface one line immediately.

**What reaches the user:** at most a few critical items, each a confirm ("learned X, save it?") or a question. If nothing is critical, stay invisible.

---

## Weekly-sweep mode (called by self-improvement)

Read `memory/context-watchlist.md` (sources the user wants watched, e.g. target companies' career pages, their own LinkedIn profile), check each for material change since last swept, append genuine gaps to `memory/context-gaps.md`, and advance the "last swept" marker only for sources that succeeded. Hand the pending queue to the caller for triage (Ingest / Skip / Mute / Link). On Ingest, propose the diff and write on approval.

---

## The queue file (`memory/context-gaps.md`)

One entry per gap: a dedup key, the source, a status (`pending` / `auto-read` / `needs-link` / `needs-user` / `drift` / `ingested` / `muted`), and a one-line note. Skipped items age to `muted` after a few passes. Nothing here is a memory write. Create the file if missing.
