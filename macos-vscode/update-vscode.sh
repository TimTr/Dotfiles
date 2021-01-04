#!/bin/zsh
#
# update-vscode.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "update-vscode.sh - start" "Configuring Visual Studio Code settings"


ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ${DEVELOPER_BIN}/vscode 2> /dev/null

# ==============================================================================
exit 0
