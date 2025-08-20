#!/usr/bin/env bash
set -e

DOTFILES_REPO="https://github.com/yuishigam1/archDots.git"
DOTFILES_DIR="$HOME/.archDots"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"

echo ">>> Backing up old configs to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

backup() {
  if [ -e "$1" ]; then
    echo "Backing up $1"
    mv "$1" "$BACKUP_DIR/"
  fi
}

# Backup important configs
backup "$HOME/.zshrc"
backup "$HOME/.config"
backup "$HOME/.local/share/applications"

echo ">>> Cloning dotfiles from $DOTFILES_REPO"
rm -rf "$DOTFILES_DIR"
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"

echo ">>> Installing packages"

# Pacman packages
if [ -f "$DOTFILES_DIR/packages/pkglist_native.txt" ]; then
  sudo pacman -Syu --needed - <"$DOTFILES_DIR/packages/pkglist_native.txt"
fi

# AUR packages
if [ -f "$DOTFILES_DIR/packages/pkglist_aur.txt" ]; then
  if ! command -v yay >/dev/null 2>&1; then
    echo ">>> yay not found, installing..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
  fi
  yay -Syu --needed --noconfirm - <"$DOTFILES_DIR/packages/pkglist_aur.txt"
fi

echo ">>> Copying dotfiles"
cp -r "$DOTFILES_DIR/.config" "$HOME/"
cp -r "$DOTFILES_DIR/.local" "$HOME/"
cp "$DOTFILES_DIR/.zshrc" "$HOME/"

echo ">>> Done! 🎉"
echo "Backup saved at: $BACKUP_DIR"
