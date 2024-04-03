#!/usr/bin/env bash

if [ -z "$HOME" ]; then echo "Seems you're \$HOMEless :("; exit 1; fi

DOTCONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles

GITCLONE="git clone --depth=1"

cd "$HOME" || exit
rm -rf "$DOTFILES"
mkdir "$DOTFILES"
cd "$DOTFILES" || exit

git clone git@github.com:OB3RG/arch_dotfiles.git $DOTFILES

rm -rf \
  "$HOME/.gitconfig" \
  "$HOME/.zshrc" \
  "$DOTCONFIG/dolphinrc" \
  "$DOTCONFIG/alacritty" \
  "$DOTCONFIG/hypr" \
  "$DOTCONFIG/swaylock" \
  "$DOTCONFIG/waybar" \
  "$DOTCONFIG/wlogout" \
  "$DOTCONFIG/wofi" \
  "$DOTCONFIG/lvim" 

ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/common/zsh/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/common/config/lvim" "$HOME/.config/lvim"
ln -s "$DOTFILES/desktop/config/alacritty" "$DOTCONFIG/alacritty"
ln -s "$DOTFILES/desktop/config/hypr" "$DOTCONFIG/hypr"
ln -s "$DOTFILES/desktop/config/swaylock" "$DOTCONFIG/swaylock"
ln -s "$DOTFILES/desktop/config/waybar" "$DOTCONFIG/waybar"
ln -s "$DOTFILES/desktop/config/wlogout" "$DOTCONFIG/wlogout"
ln -s "$DOTFILES/desktop/config/wofi" "$DOTCONFIG/wofi"
ln -s "$DOTFILES/desktop/config/dolphinrc" "$DOTCONFIG/dolphinrc"

cd "$HOME" || exit
rm -f "${HOME}/.zcompdump*"

echo "ENJOY! :)"
