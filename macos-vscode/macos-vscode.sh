#!/bin/zsh
#
# macos-vscode.sh

# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/template/dot-source.sh
status "macos-vscode.sh - start" "Configuring Visual Studio Code settings"


ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ${DEVELOPER_BIN}/vscode

# ==============================================================================
status "install-vscode.sh - done." "Returning to parent script."
exit 0
