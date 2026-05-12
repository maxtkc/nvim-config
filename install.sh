#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink tmux config
ln -sf "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"
echo "Linked tmux.conf -> ~/.tmux.conf"

# Install TPM if not already present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "Installed TPM"
else
  echo "TPM already installed"
fi

echo "Done. Reload tmux config with: tmux source ~/.tmux.conf"
echo "Then install plugins with: prefix + I"

# Symlink claude-status into ~/.local/bin and wire it into Claude Code
mkdir -p "$HOME/.local/bin"
ln -sf "$SCRIPT_DIR/claude-status" "$HOME/.local/bin/claude-status"
echo "Linked claude-status -> ~/.local/bin/claude-status"

mkdir -p "$HOME/.claude"
python3 - "$HOME/.claude/settings.json" <<'PY'
import json, sys
path = sys.argv[1]
try:
    with open(path) as f:
        data = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    data = {}
data["statusLine"] = {"type": "command", "command": "claude-status"}
with open(path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
PY
echo "Set statusLine in ~/.claude/settings.json"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "Note: ~/.local/bin is not on PATH; add it so Claude Code can find claude-status." ;;
esac
