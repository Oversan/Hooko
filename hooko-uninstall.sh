#!/usr/bin/env bash

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RESET=$ESC_SEQ"39;49;00m"

if [ -e ".csscomb.json" ]; then
  rm .csscomb.json
  echo -e $COL_CYAN".csscomb.json is removed from project"$COL_RESET
fi

if [ -e ".git/hooks/pre-commit" ]; then
  rm .git/hooks/pre-commit
  echo -e $COL_CYAN"Pre-commit hook is removed from project git"$COL_RESET
fi

if [ -e -a "node_modules/.bin/@csscomb" ]; then
  if [ "$(uname)" == "Darwin" ]; then
    npm uninstall csscomb --save-dev
    npm uninstall fixmyjs --save-dev
  else
  	sudo npm uninstall csscomb --save-dev
    sudo npm uninstall fixmyjs --save-dev
  fi
  echo -e $COL_CYAN"Uninstall local npm packets: csscomb, fixmyjs."$COL_RESET
fi

echo -e $COL_CYAN"Hooko is uninstalled"$COL_RESET
