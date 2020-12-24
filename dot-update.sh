#!/bin/zsh
#
# dot-update.sh

source ${HOME}/.functions
source ${HOME}/.aliases

# determine the filename for the called file (e.g. update or dot)
MYNAME=`basename "$0"`
if [ "$MYNAME" = "dot" ]; then
  status "Running as $MYNAME" "This is expected."
else
  status "Running as $MYNAME" "Something is wrong"
fi

# Just report that it is working...
message "Running message test.sh from" "$PWD"
status "Running status test.sh from" "$PWD"
error "Running error test.sh from " "$PWD"

message "dot-update.sh - done." "Restart Terminal for changes to take effect"

exit 0

