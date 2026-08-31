#!/bin/sh

confm=/home/$USER/.config/mango

yes_no() {
  while true; do
    read -p "$" " [Y/n] " local yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]*)
      echo "Aborted"
      return 1
      ;;
    esac
  done

}

if ! [ -e README.md ]; then
  echo "Please run this script from the repository directory!" && return
fi

if diff -rs mango/ $confm; then
  echo "Your config files dont differ from the ones in the git repo.\n Maybe check if repo is up to date?" && return
else
  yes_no "Warning! Your files in $confm will be overwritten! Proceed?" && echo yay
fi
