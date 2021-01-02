#!/bin/zsh
#
# update-vscode.sh

# Import the default functions used in these scripts
source ${HOME}/.functions
status "update-vscode.sh - start" "Configuring Visual Studio Code settings"


ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ${DEVELOPER_BIN}/vscode

# ==============================================================================
exit 0
