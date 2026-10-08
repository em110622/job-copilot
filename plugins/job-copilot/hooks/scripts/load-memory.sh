#!/usr/bin/env bash
# Job Co-Pilot: SessionStart pointer.
# Deliberately light. It does NOT cat all memory into context (that would bloat
# every session). It points Claude at the routing brain, lists which memory
# files and applications exist, and (once) announces a version update.

set -euo pipefail

# Plugin package root, derived from this script's location (hooks/scripts/ -> ../..).
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." 2>/dev/null && pwd || true)"

# The workspace is the current working directory (where the user's CLAUDE.md lives).
MEM="./memory"

if [ ! -d "$MEM" ]; then
  cat <<'MSG'
Job Co-Pilot is installed here but not set up yet (no memory/ folder in this workspace).

INSTRUCTION FOR CLAUDE (backstop, optional): Answer the user's message normally first. If their message is a request to start (for example "set me up", "get started", "set up job co-pilot"), run the setup flow (the get-started skill, same as /job-copilot:setup). Otherwise, after answering, add ONE short line letting them know Job Co-Pilot is not set up in this folder yet and they can start anytime by saying "set me up" (about ten minutes, skippable). Keep it to one line, no emoji, no em-dashes, and do not repeat it every turn.
MSG
  exit 0
fi

echo "Job Co-Pilot active. Read ./CLAUDE.md, then load the relevant memory files on demand per its routing table."
echo "Available memory files:"
ls -1 "$MEM"/*.md 2>/dev/null | sed 's#^# - #' || echo " (none yet)"
if [ -d "./applications" ]; then
  echo "Applications (most recent first):"
  ls -1t ./applications 2>/dev/null | head -10 | sed 's#^#   - applications/#' || true
fi

# --- What's new: announce a version change once ---
NEWVER=""
if [ -n "$ROOT" ] && [ -f "$ROOT/.claude-plugin/plugin.json" ]; then
  NEWVER="$(grep -m1 '"version"' "$ROOT/.claude-plugin/plugin.json" 2>/dev/null | sed -E 's/.*"version"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/' || true)"
fi

MARK="$MEM/.jcp-version"
if [ -n "$NEWVER" ]; then
  if [ -f "$MARK" ]; then
    OLDVER="$(cat "$MARK" 2>/dev/null || true)"
    if [ -n "$OLDVER" ] && [ "$OLDVER" != "$NEWVER" ]; then
      echo ""
      echo "INSTRUCTION FOR CLAUDE: Job Co-Pilot was updated from $OLDVER to $NEWVER since this user last used it here. Once this session, tell them in a short line or two that it updated and what changed, based on the notes below. Plain, no emoji, no em-dashes, and do not repeat it in later turns."
      if [ -n "$ROOT" ] && [ -f "$ROOT/CHANGELOG.md" ]; then
        echo "--- what's new in $NEWVER ---"
        awk '/^## /{c++} c==1{print} c==2{exit}' "$ROOT/CHANGELOG.md" 2>/dev/null || true
      fi
      printf '%s' "$NEWVER" > "$MARK" 2>/dev/null || true
    fi
  else
    # No marker yet: set the baseline silently so we never show a false "updated" message.
    printf '%s' "$NEWVER" > "$MARK" 2>/dev/null || true
  fi
fi

exit 0
