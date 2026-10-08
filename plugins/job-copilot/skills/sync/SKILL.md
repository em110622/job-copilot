---
name: sync
description: Refresh your memory from your connected tools and files. Pulls new facts (new recruiter and hiring contacts, interview invites, application confirmations and rejections, changes to your LinkedIn profile or CV) and proposes surgical additions to your memory and application status lines. Never a wholesale rewrite. Backs up first, proposes a diff, writes only on your yes. Triggers on "/sync", "sync my memory", "refresh my context". Run it whenever your context has drifted, then run consolidate right after.
---

# Sync - Refresh Memory From Live Sources (safe mode)

Heavier and more deliberate than the passive `memory-keeper` capture; run it on purpose.

Memory lives in `memory/` next to `CLAUDE.md`. Read `memory/tools.md` for which tools and files are connected.

## Step 0 - Back up first (non-negotiable)
```bash
MEMORY_DIR="<workspace>/memory"
BACKUP="<workspace>/memory/_backups/$(date +%Y-%m-%d_%H%M%S)"
if [ -d "$MEMORY_DIR" ] && [ -n "$(ls -A "$MEMORY_DIR" 2>/dev/null)" ]; then
  mkdir -p "$BACKUP" && tar --exclude=./_backups -cf - -C "$MEMORY_DIR" . | tar -xf - -C "$BACKUP" && echo "Backed up memory to $BACKUP"
else
  echo "Memory not found or empty - stop and check before syncing."
  exit 0
fi
```
If the backup fails, STOP.

## Step 1 - Pull fresh context (read-only, fault-isolated)
Use only what is connected:
- **Email (~30 days):** application confirmations (→ status `applied`), rejections (→ `closed`), interview invites (→ `interview`, with date), recruiter outreach and new hiring contacts, promises made in threads.
- **Calendar (if connected):** upcoming interviews and coffee chats not yet in an application folder or `contacts.md`.
- **LinkedIn (via the browser, read-only):** the user's own profile, compared with `memory/experience.md` and `memory/profile.md` (titles, dates, headline). Report differences; don't decide which is right.
- **Source files:** a newer master CV or new documents in the source-material paths from `memory/tools.md`.

## Step 2 - Propose a diff, do not write yet
```
Proposed memory updates:
• applications/2026-10-acme-pm/posting.md → UPDATE: Status: interview 2026-10-15
• contacts.md   → ADD: <recruiter, company, thread date>
• experience.md → FLAG: LinkedIn says <X>, record says <Y> - which is right?
(profile.md - no change)
```

## Step 3 - Write only what's confirmed
Apply only approved lines, surgically. Dated changelog line per changed file. Keep the backup. Confirm what was written.

## Guardrails
- Additive and surgical only. Never rewrite a whole file.
- Never change a forløb's facts from an outside source without the user's confirmation; outside sources can be wrong too.
- If a source is unreachable, note it and continue.
