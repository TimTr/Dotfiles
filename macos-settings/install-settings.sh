#!/bin/zsh
#
# install-settings.sh
#
# Import the default functions used in these scripts
source ${HOME}/.functions
status "install-settings.sh" "Configuring app and tool settings"



# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-settings.sh



# ==============================================================================
exit 0


