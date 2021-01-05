#!/bin/sh
function msg() {
  echo "$(date '+%Y-%m-%dT%H:%M:%S') (${BASH_LINENO[0]}:${FUNCNAME[1]}) $@"
}

function result() {
  if [ $? -eq 0 ]; then
    msg "Succeeded $@"
  else
    msg "Failed $@"
    exit 1
  fi
}

msg 'Start install homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
result 'install homebrew'

msg 'Start install ansible, ansible-lint'
brew install ansible ansible-lint
result 'install ansible, ansible-lint'
