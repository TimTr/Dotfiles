#!/bin/zsh
#
# install-xcode.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "install-xcode.sh" "Configuring Xcode"


# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-xcode.sh




# ==============================================================================
exit 0

