#!/bin/zsh
#
# install-vscode.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "install-vscode.sh" "Configuring Visual Studio Code settings"


# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-vscode.sh




# ==============================================================================
exit 0

