#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="https://github.com/yuishigam1/archDots.git"
DOTFILES_DIR="$HOME/.archDots"

echo ">>> Preparing dotfiles at $DOTFILES_DIR"
if [ -d "$DOTFILES_DIR/.git" ]; then
  echo ">>> Updating existing clone..."
  git -C "$DOTFILES_DIR" pull --ff-only
else
  rm -rf "$DOTFILES_DIR"
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo ">>> Handing off to archDots/install.sh"
exec bash "$DOTFILES_DIR/install.sh"
