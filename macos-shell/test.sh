#!/bin/zsh
#
# test.sh -- installed into the $PATH as a test

# Import the default functions used in these scripts
source ${HOME}/.functions
source ${HOME}/.aliases

message "Running message test.sh from" "$PWD"
status "Running status test.sh from" "$PWD"
error "Running error test.sh from " "$PWD"


exit 0

