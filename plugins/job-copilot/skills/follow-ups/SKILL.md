---
name: follow-ups
description: Your job-search open-loops digest. Finds who you're waiting on (applications and threads with no reply past your follow-up window, contacts whose next touch is due) and what you owe (unanswered recruiter mail, promised documents, thank-you notes not sent), ranks them, and surfaces them for triage with draft nudges. Triggers on "follow-ups", "who am I waiting on", "what do I owe", "open loops", "who should I follow up with".
---

## GUIDED DELIVERY - one part at a time (always)
Show Section A (Waiting on others) as its own turn and let the user triage it, then Section B (Waiting on you). Keep each ranked list bulleted.

## FORMATTING - lists, never paragraphs (always)

---

Read `CLAUDE.md`, `memory/profile.md` (timezone), `memory/tools.md` (email tool, follow-up default, non-working days), and `memory/contacts.md` first. Then scan `applications/*/posting.md` status blocks. Surface everything in this session. Never message anyone. No em-dashes.

## SECTION A - Waiting on others
1. **Applications:** status `applied` or `interview` where `Follow up by:` has passed, or no reply after the follow-up default.
2. **Email threads** (if email is connected; ~30-day window): threads with recruiters, hiring contacts, or people in `memory/contacts.md` where the user sent the last message, it contained a question or request, and it is past the follow-up default. Verify each by reading the thread; discard if replied to or closed.
3. **Contacts:** entries in `memory/contacts.md` where something was promised *to* the user and is overdue.

Rank: HIGH (active interview process, a deadline, or an offer), MEDIUM (applied, past the follow-up date), LOW (networking, exploratory).

## SECTION B - Waiting on you
1. **Email** (if connected): recruiter or hiring mail that the user hasn't answered; interview invites not confirmed.
2. **Promises:** things the user promised in `memory/contacts.md` or a `debrief-*.md` (send a portfolio, a reference list, a thank-you note) not marked done.
3. **Next touch due:** contacts whose `next touch` date has passed (keep the network warm).
4. **Stalled drafts:** applications with `Status: drafting` older than a week, or past their deadline.

## OUTPUT - one section at a time
```
Follow-ups - [date]

Waiting on others ([N])
🔴 <company/person> - X days · your ask: "<snippet>" · <channel>
🟡 ...
🟢 ...

Waiting on you ([N])
1. <what> - <who> - <since when / deadline>
2. ...
```
Top 5 per section if many. Empty section: "nothing waiting". Both empty: "No open loops. You're clear."

## Triage
- Section A per item: `nudge` (draft a short follow-up in the user's voice and language; save as an email draft only if they ask), `update` (change status or follow-up date in `posting.md` / `contacts.md`), `snooze <date>`, or `drop` (e.g. mark the application `closed`).
- Section B per item: `draft` (draft the reply or the promised note), `done`, `snooze <date>`, or `drop`.

Wait for the user's reply, then act. Every file change is proposed and written on yes, with a one-line confirmation. Nothing sent on their behalf.
