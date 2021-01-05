#!/bin/sh
function msg() {
  printf '\033[34;1m%s\033[m\n' "$(date '+%Y-%m-%dT%H:%M:%S') (${BASH_LINENO[0]}:${FUNCNAME[1]}) $@"
}

function checkRc() {
  if [ $? -eq 0 ]; then
    msg "Succeeded $@"
  else
    msg "Failed $@"
    rc=1
  fi
}

function confirmExecution() {
  msg "execute ansible?"
  msg "input yes or no"
  read input
  if [ -z $input ]; then
    echo "input yes or no"
    confirmExecution
  elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ]; then
    break
  elif [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ]; then
    msg "Finish script"
    exit 1
  else
    msg "input yes or no"
    confirmExecution
  fi
}

rc=0
msg 'check syntax'
ansible-playbook -vv --syntax-check setup.yml -i inventory
checkRc 'check syntax'
msg 'run ansible-lint'
ansible-lint -vvv
checkRc 'run ansible-lint'
msg 'dry run ansible'
ansible-playbook --check --diff setup.yml -i inventory
checkRc 'dry run ansible'
if [ $rc -eq 1 ]; then
  msg 'check stdout'
  exit 1
fi
confirmExecution
msg 'run ansible'
ansible-playbook setup.yml -i inventory
checkRc 'run ansible'
