#!/bin/zsh
#
# dot-update.sh

source ${HOME}/.functions
source ${HOME}/.aliases

message "Running message test.sh from" "$PWD"
status "Running status test.sh from" "$PWD"
error "Running error test.sh from " "$PWD"

message "dot-update.sh - done." "Restart Terminal for changes to take effect"

exit 0

