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
