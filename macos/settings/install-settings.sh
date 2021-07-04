#!/bin/zsh
#
# install-settings.sh
#
# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "install-settings.sh" "Configuring app and tool settings"



# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-settings.sh



# ==============================================================================
exit 0


