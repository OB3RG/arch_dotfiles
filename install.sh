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

git init
git remote add origin git@github.com:OB3RG/dotfiles.git
git pull origin master

rm -rf \
  "$DOTFZF" \
  "$DOTLOCAL" \
  "$HOME/.bashrc" \
  "$HOME/.gitconfig" \
  "$HOME/.tmux.conf" \
  "$HOME/.eslintrc.js" \
  "$HOME/.tmuxgo" \
  "$HOME/.zshrc"
  "$HOME/.vim"

mkdir -p \
  "$DOTLOCAL" \

ln -s "$DOTFILES/bashrc" "$HOME/.bashrc"
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/tmuxgo" "$HOME/.tmuxgo"
ln -s "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"
ln -s "$DOTFILES/eslintrc.js" "$HOME/.eslintrc.js"
ln -s "$DOTFILES/vim-config" "$HOME/.vim"

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

# Required to kill the terminal's border in GNOME 3.32+
gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"
echo
echo "ENJOY! :)"

