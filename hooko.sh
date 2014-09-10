#!/usr/bin/env bash

exists() {
  if command -v $1 &>/dev/null
  then
    return 0
  else
    return 1
  fi
}

file='https://raw.githubusercontent.com/Oversan/Hooko/master/pre-commit'

if exists wget; then
  wget $file -P .git/hooks
else
  if exists curl; then
    curl $file > .git/hooks/pre-commit
  fi
fi

echo "pre-commit hook is added to .git/hooks of this project"
