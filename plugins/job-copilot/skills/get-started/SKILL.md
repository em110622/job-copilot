---
name: get-started
description: Start here - sets up Job Co-Pilot for a new user by walking through a few questions and writing their routing brain and memory. Triggers on "set me up", "get started", "get me started", "set up job co-pilot", "job copilot setup", "onboard me", "how do I start", "help me start", or any first-time request to begin using Job Co-Pilot. This is the plain-language front door; it runs the same flow as the /job-copilot:setup command.
---

The user wants to start using Job Co-Pilot. Run the full setup now.

Follow the setup flow in this plugin's `commands/setup.md` end to end: locate the workspace, check which tools are connected, ask the setup questions in short batches (proposing answers from their CV and connected tools where you can), write the `CLAUDE.md` routing brain and the `memory/` scaffold on their confirmation, then show them their memory as a short recap and point them to `experience-coach` and `/job-copilot:first-run`.

If you cannot locate `commands/setup.md`, tell the user and ask them to run `/job-copilot:setup` directly rather than improvising a different setup.

This skill exists so a plain-language "set me up" works without knowing the slash command. It is the same flow as `/job-copilot:setup`; do not run a second, different setup.
