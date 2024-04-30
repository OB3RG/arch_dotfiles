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
  "$DOTCONFIG/lvim" 

ln -s "$DOTFILES/common/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/common/zsh/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/common/config/lvim" "$HOME/.config/lvim"

cd "$HOME" || exit
rm -f "${HOME}/.zcompdump*"

echo "ENJOY! :)"
