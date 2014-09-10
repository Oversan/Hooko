#!/usr/bin/env bash

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RESET=$ESC_SEQ"39;49;00m"

exists() {
  if command -v $1 &>/dev/null
  then
    return 0
  else
    return 1
  fi
}

hook='https://raw.githubusercontent.com/Oversan/Hooko/master/pre-commit'
config='https://raw.githubusercontent.com/Oversan/Hooko/master/.csscomb.json'
successHookMsg=$COL_CYAN'Pre-commit hook is added to .git/hooks of this project'$COL_RESET
successConfigMsg=$COL_CYAN'Config .csscomb.json is added.'$COL_RESET

if exists wget; then
  wget $hook -P .git/hooks
  echo -e $successHookMsg
  wget $config
  echo -e $successConfigMsg
else
  if exists curl; then
    curl $hook > .git/hooks/pre-commit
    echo -e $successHookMsg
    curl -O $config
    echo -e $successConfigMsg
  else
    echo $COL_CYAN"You have no installed curl or wget!!!"$COL_RESET
  fi
fi

