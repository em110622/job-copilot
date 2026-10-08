---
name: tailor-application
description: Tailor an application to one job posting. Paste a link or the text; it saves the posting, maps the requirements to your forløb, shows the fit and the gaps, picks an angle with you, then drafts a tailored CV and cover letter built only from your own records, in your voice, language, and format. Ends with an honesty check that traces every claim to its source. Triggers on "tailor my application", "apply for this", "write a cover letter for", "tailor my CV", or a pasted job posting. Draft-only; never submits anything.
---

## GUIDED DELIVERY - one part at a time (always)
Present in this order, each as its own short turn, and wait where a decision is needed: (1) fit and gaps, (2) angle, (3) drafts, (4) honesty check and save. Never dump everything at once.

---

You are tailoring an application. Read `CLAUDE.md` (hard rules), `memory/profile.md` (language, market, output format, situation), `memory/targets.md`, `memory/experience.md`, `memory/stories.md`, `memory/voice.md`, and `memory/contacts.md` (reference consent) first.

## Step 0 - Get and save the posting
- If given a URL, fetch it (WebFetch first; if it fails or needs a login, use the browser named in `memory/tools.md` to read the page text). If you cannot fetch it, ask the user to paste the text. Never guess what a posting says.
- Detect the posting's language and market. The application is written in that language unless the posting or the user says otherwise.
- Create `applications/YYYY-MM-<company>-<role>/` (lowercase, hyphens) and save `posting.md`: the full text, the link, today's date, and a status block:
  ```
  Status: drafting
  Next step: finish application
  Follow up by:
  Deadline: <from the posting, if stated>
  ```
- If a folder for this application already exists, use it.

## Step 1 - Fit and gaps
Break the posting into requirements (must-have and nice-to-have, explicit and implied: the problem this hire is meant to solve). For each requirement, find the forløb, results, and stories that match. Present:

```
Fit - <role> at <company>

Strong matches
- <requirement> → <forløb: result>
Partial matches
- <requirement> → <forløb> (what's missing: e.g. no number, your part unclear)
Gaps
- <requirement> - nothing in your records
Against your targets
- <any deal-breaker or must-have from targets.md this posting conflicts with>
```

For each gap: ask whether the user has relevant experience that isn't recorded yet. If yes, capture it (hand to `experience-coach` Mode 2, briefly). If no, the gap stays a gap; never write around it with vague claims. For partial matches, offer one sharpening question each (experience-coach Mode 3, scoped to this posting).

Save the analysis to `fit.md` in the application folder.

## Step 2 - Angle
Propose the angle in three lines: the one problem this employer most needs solved, the two or three forløb that prove you have solved it before, and what to downplay. Let the user adjust before drafting.

## Step 3 - Drafts
**Cover letter.** In the user's voice (`memory/voice.md`, the cover-letter and language entries) and the market's conventions for length and tone. Open with the angle, not with "I am writing to apply". Build the body on two or three forløb, each told as starting point → your part → effect. Close with a plain line. No generic self-praise; results do that work.

**CV.** Start from the user's master CV or template (`memory/tools.md`). Tailor by selecting, ordering, and phrasing, not by inventing: lead with the forløb most relevant to this posting, phrase results with the posting's vocabulary where it is honestly the same thing, cut what does not serve this role. Respect each result's publicity level. Name references only with recorded consent.

Produce both in the output format from `memory/profile.md` (an editable doc, a Word file from their template, Markdown, or PDF; use the matching skill or artifact type) and save them, or links to them, in the application folder.

## Step 4 - Honesty check, then save
Show a compact trace table, one row per factual claim in the drafts:

```
| Claim in draft | Source | OK? |
| "<claim>" | experience.md › <forløb> › Results | ✓ |
| "<claim>" | said in session today | ✓ (propose saving to memory) |
| "<claim>" | estimate, not yet approved wording | ⚠ confirm |
```

Any claim without a source gets removed or confirmed by the user before the drafts are final. Then:
- Update `posting.md` status only when the user says they applied (`Status: applied YYYY-MM-DD`, `Follow up by: <date per tools.md default>`).
- Propose memory updates for anything new and durable that surfaced (new results, a sharper value proposition, a new contact at the company).

Never submit the application, fill in forms, or send anything. The user sends.
