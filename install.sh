#!/usr/bin/env bash

if [ -z "$HOME" ]; then echo "Seems you're \$HOMEless :("; exit 1; fi

DOTCONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles
DOTFZF=$HOME/.fzf
DOTLOCAL=$HOME/.local/share/dotfiles

GITCLONE="git clone --depth=1"

cd "$HOME" || exit
rm -rf "$DOTFILES"
mkdir "$DOTFILES"
cd "$DOTFILES" || exit

git clone https://github.com/OB3RG/dotfiles.git $DOTFILES

rm -rf \
  "$DOTFZF" \
  "$DOTLOCAL" \
  "$HOME/.bashrc" \
  "$HOME/.gitconfig" \
  "$HOME/.eslintrc.js" \
  "$HOME/.zshrc" \
  "$HOME/.vim" \
  "$HOME/.Xresources" \
  "$HOME/.config/bspwm" \
  "$HOME/.config/sxhkd" \
  "$HOME/.config/polybar" \
  "$HOME/.config/dunst" \
  "$HOME/.config/alacritty"


mkdir -p \
  "$DOTLOCAL" \

ln -s "$DOTFILES/bashrc" "$HOME/.bashrc"
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/eslintrc.js" "$HOME/.eslintrc.js"
ln -s "$DOTFILES/vim" "$HOME/.vim"
ln -S "$DOTFILES/Xresources" "$HOME/.Xresources"
ln -s "$DOTFILES/bspwm" "$HOME/.config/bspwm"
ln -s "$DOTFILES/sxhkd" "$HOME/.config/sxhkd"
ln -s "$DOTFILES/polybar" "$HOME/.config/polybar"
ln -s "$DOTFILES/dunst" "$HOME/.config/dunst"
ln -s "$DOTFILES/alacritty" "$HOME/.config/alacritty"

$GITCLONE https://github.com/junegunn/fzf.git "$DOTFZF"
"$DOTFZF/install" --key-bindings --completion --no-update-rc

ZSHPLUGS=(
  "zsh-completions"
  "zsh-history-substring-search"
  "zsh-syntax-highlighting"
)

for INDEX in ${!ZSHPLUGS[*]}; do
  ZSHPLUG="${ZSHPLUGS[$INDEX]}"
  $GITCLONE "https://github.com/zsh-users/$ZSHPLUG.git" "$DOTLOCAL/$ZSHPLUG"
done

cd "$HOME" || exit
rm -f "${HOME}/.zcompdump*"

echo "ENJOY! :)"

