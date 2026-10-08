# Job Co-Pilot

A job search means holding a lot at once: your whole career told five different ways, a dozen half-finished applications, recruiters waiting on replies, interviews to prep and debrief, and a network that goes cold if you don't touch it.

Job Co-Pilot carries that overhead. It knows the value you have delivered, builds every application from it, preps you for interviews, and keeps track of who is waiting on whom.

It runs inside Claude Cowork, and works in Claude Code too.

## How it works

Everything starts from one question: **what value did you deliver?**

Your experience is kept as *forløb*, one record per project or initiative, each with a reference, your responsibility, the goals, and the results. CV bullets, cover-letter sentences, interview stories, and LinkedIn posts are all different-length tellings of the same records. Write the record once, tell it many ways, and the facts never drift apart.

The co-pilot improves those records as you go. When a result says what was *delivered* but not what it *changed*, or your own part is vague, it asks one sharp question. It never invents a number, a result, or a reference.

Two hard rules:

- **Truth.** Every claim in a document it drafts traces back to your records or to something you said. It shows you the trace before anything is final.
- **Draft-only.** It never sends, posts, submits, or connects on your behalf. You do.

## What's included

Setup writes three things into your workspace: a **`CLAUDE.md`** routing brain, a **`memory/`** folder (profile, experience, stories, targets, contacts, tools, voice, decisions), and an **`applications/`** folder with one subfolder per application.

**Workflows**

- **experience-coach** - import your CV, add forløb, and sharpen them so the value is clear. Start here.
- **tailor-application** - paste a posting; get fit and gaps, an angle, and a tailored CV and cover letter, with an honesty check.
- **interview-prep** - company, role, and interviewer research; likely questions mapped to your stories; questions to ask.
- **mock-interview** - practice one question at a time with direct feedback.
- **interview-debrief** - capture the interview, update stories and contacts, draft a thank-you note.
- **linkedin-writer** - messages (outreach, referral asks, recruiter replies) and posts, with a discretion check for quiet searches.
- **follow-ups** - who you're waiting on, what you owe, which contacts are due a check-in.

**Keeping it sharp**

- **memory-keeper**, **sync**, and **consolidate** keep your memory captured, refreshed, and tidy.
- **self-improvement** learns your voice from how you edit its drafts.
- **improve** weighs an outside idea about your Claude setup and recommends what to adopt.
- **get-started** is the plain-language front door: say "set me up".

**Commands:** `/job-copilot:setup`, `/job-copilot:first-run`, `/job-copilot:improve`.

## What you need

- Claude Cowork or Claude Code.
- Optional but useful: an email connector (e.g. Gmail), a browser Claude can use for LinkedIn and company research, and your current CV.

## Get it

This repo is a Claude plugin marketplace (the plugin lives in `plugins/job-copilot/`). Install by URL or path, not by downloading the ZIP.

**In Claude Cowork:** Customize > Plugins > Add marketplace, paste the repo link, install **Job Co-Pilot**, then open a new chat and type **`set me up`**.

**In Claude Code:**

```
/plugin marketplace add <path-or-url-to-this-repo>
/plugin install job-copilot@job-copilot
```

Then type **`set me up`** (or run `/job-copilot:setup`), followed by `/job-copilot:first-run`.

## Your data

Your memory and applications live in your workspace folder, on your machine. If you use this repo's own folder as your workspace, `.gitignore` keeps `CLAUDE.md`, `memory/`, and `applications/` out of git so your personal data never ends up in a commit.

## Credit

Job Co-Pilot is built on the structure and thinking of **[PM Co-Pilot](https://github.com/IamBlum/pm-copilot) by Daniel Blum**: the routing brain, the topic-routed memory, propose-only memory writes, guided one-part-at-a-time workflows, and the self-improvement loop all come from there. Both are MIT licensed.

## License

MIT. See [LICENSE](LICENSE).
