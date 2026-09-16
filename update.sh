#!/bin/sh

conf=/home/$USER/.config
yes_no() {
  while true; do
    read -p "$* [y/n]: " yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]*)
      echo "Aborted!"
      return 1
      ;;
    esac
  done
}

if ! pwd | grep "hmc" >/dev/zero; then
  echo "Please run this script from the repository directory!" && return 0
fi

diff -rs mango $conf/mango && echo "Your config files dont differ from the ones in the git repo!\n Maybe check if the repo is up to date?" && return 0

if yes_no "Update mango config in "$conf"?" && yes_no "Are you sure you want to overwrite the .config?"; then
  cp -r ./mango/* "$conf/mango/"
  cp -r ./foot "$conf/foot"
  cp -r ./fastfetch "$conf/fastfetch"
  cp -r ./nvim "$conf/nvim"
  cp -r ./waybar/ "$cong/mango"
  cp shells/.zshrc "$HOME/.zshrc"

elif yes_no "Or update the git repo config?" && yes_no "Are you sure you want to overwrite the git repo?"; then
  cp -r "$conf/mango/*" ./mango/
  cp -r "$conf/foot/*" ./foot
  cp -r "$conf/fastfetch/*" ./fastfetch
  cp -r "$conf/nvim/*"" ./nvim
  cp "$HOME/.zshrc"" ./shells
fi
