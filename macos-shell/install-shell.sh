#!/bin/zsh
#
# install-shell.sh

# Source functions.sh so we have functions like "status" and "message"
source $(dirname $0)/functions.sh
status "install-system.sh" "Configuring shell and OS settings."


# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-shell.sh




# ==============================================================================
exit 0


