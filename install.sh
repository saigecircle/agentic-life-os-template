#!/usr/bin/env bash
set -euo pipefail

REPO_OWNER="${REPO_OWNER:-saigecircle}"
REPO_NAME="${REPO_NAME:-agentic-life-os-template}"
BRANCH="${BRANCH:-main}"
DEFAULT_DEST="$HOME/Documents/LifeOS"
FORCE="false"
DEST=""

usage() {
  cat <<USAGE
Install the Agentic Life OS starter vault.

Usage:
  ./install.sh [destination] [--force]

Examples:
  ./install.sh ~/Documents/LifeOS
  curl -fsSL https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${BRANCH}/install.sh | bash -s -- ~/Documents/LifeOS

If destination is omitted, the script asks where to install.
By default, existing non-empty folders are refused. Use --force to merge/overwrite.
USAGE
}

for arg in "$@"; do
  case "$arg" in
    --force) FORCE="true" ;;
    -h|--help) usage; exit 0 ;;
    *) DEST="$arg" ;;
  esac
done

if [ -z "$DEST" ]; then
  printf "Where should the Life OS vault be installed? [%s] " "$DEFAULT_DEST"
  read -r input || true
  DEST="${input:-$DEFAULT_DEST}"
fi

DEST="${DEST/#\~/$HOME}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || pwd)"
TEMP_DIR=""

if [ -d "$SCRIPT_DIR/vault" ]; then
  SOURCE_VAULT="$SCRIPT_DIR/vault"
else
  TEMP_DIR="$(mktemp -d)"
  trap 'rm -rf "$TEMP_DIR"' EXIT
  ARCHIVE_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/refs/heads/${BRANCH}.tar.gz"
  echo "Downloading template from $ARCHIVE_URL"
  curl -fsSL "$ARCHIVE_URL" -o "$TEMP_DIR/template.tar.gz"
  tar -xzf "$TEMP_DIR/template.tar.gz" -C "$TEMP_DIR"
  SOURCE_VAULT="$TEMP_DIR/${REPO_NAME}-${BRANCH}/vault"
fi

if [ ! -d "$SOURCE_VAULT" ]; then
  echo "Could not find vault template at: $SOURCE_VAULT" >&2
  exit 1
fi

if [ -d "$DEST" ] && [ "$(find "$DEST" -mindepth 1 -maxdepth 1 2>/dev/null | head -n 1)" ] && [ "$FORCE" != "true" ]; then
  echo "Destination exists and is not empty: $DEST" >&2
  echo "Choose an empty folder, or rerun with --force if you intentionally want to merge/overwrite." >&2
  exit 1
fi

mkdir -p "$DEST"

if command -v rsync >/dev/null 2>&1; then
  rsync -a "$SOURCE_VAULT/" "$DEST/"
else
  cp -R "$SOURCE_VAULT/." "$DEST/"
fi

find "$DEST" -name .gitkeep -type f -delete 2>/dev/null || true

cat <<DONE

Life OS starter vault installed at:
  $DEST

Next steps:
  1. Open this folder in Obsidian, VS Code, Cursor, or your Markdown editor.
  2. Read README.md.
  3. Fill in 06 Meta/About Me.md.
  4. Create your first project in 01 Projects/.
  5. Drop one messy note into 00 Inbox/ and ask an AI agent to help file it.

DONE
