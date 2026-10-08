---
name: consolidate
description: A reflective cleanup pass over your memory files (no external fetch). Merges duplicates, retires stale entries, sharpens durable facts, keeps stories consistent with their forløb, and fixes the index so a future session orients fast. Backs up first, proposes changes, writes only on your yes. Triggers on "consolidate my memory", "clean up my memory". Run it right after sync, or whenever memory needs a cleanup.
---

# Consolidate - Memory Hygiene (safe mode)

A reflective pass so a future session orients quickly without re-asking. Reads and restructures the memory folder only; no external fetch (that's `sync`).

## Step 0 - Back up first (non-negotiable)
Snapshot the memory folder as in `sync`. If the backup fails, STOP.

## Phase 1 - Take stock
List the memory folder and the routing table in `CLAUDE.md`. Skim each file; note overlap, staleness, thin spots.

## Phase 2 - Plan (propose-only)
- **Consistency (most important):** every story in `stories.md` agrees with its forløb in `experience.md` (numbers, dates, your part). Where they disagree, the forløb wins unless the user says otherwise; flag each case.
- **Duplicates:** the same forløb or result recorded twice, a contact listed in two sections.
- **Stale:** applications closed for months (keep the folder; fold lasting lessons into `decisions.md` or `voice.md`), contacts with no relevance left, targets that changed.
- **Thin forløb:** list the ones with no results or effect, as candidates for `experience-coach` (don't fix them here).
- **Index:** if `experience.md` has grown too long to scan, propose splitting it (e.g. `memory/experience/<employer>.md`) and update the routing table.

Present the plan as a short list: merge / retire / rewrite / split / reindex, one line each.

## Phase 3 - Apply only what's confirmed
Apply approved changes. Dated changelog line in each affected file. Keep the backup.

## Guardrails
- Propose-only. No write without the user's yes.
- Never delete a forløb, story, or contact outright; retire by folding forward what lasts.
- When two facts conflict and you can't tell which is current, ask.
