#!/usr/bin/env bash

ESC_SEQ="\x1b["
COL_CYAN=$ESC_SEQ"36;01m"
COL_RED=$ESC_SEQ"31;01m"
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
    echo -e $COL_RED"Sctipt is terminated"$COL_RESET
    exit 1
  fi
fi

if exists node; then
  if [ "$(uname)" == "Darwin" ]; then
    npm install csscomb --save-dev
    npm install csscomb -g
    npm install fixmyjs --save-dev
    npm install fixmyjs -g
  else
    sudo npm install csscomb --save-dev
    sudo npm install csscomb -g
    sudo npm install fixmyjs --save-dev
    sudo npm install fixmyjs -g
  fi
  echo -e $COL_CYAN"We have installed npm packets: csscomb, fixmyjs."$COL_RESET
else
  echo -e $COL_CYAN"You should install NodeJs."$COL_RESET
  rm .git/hooks/pre-commit
  rm .csscomb.json
  echo -e $COL_RED"Sctipt is terminated"$COL_RESET
  exit 1
fi

chmod +x .git/hooks/pre-commit
