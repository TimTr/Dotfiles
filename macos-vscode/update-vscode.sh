#!/bin/zsh
#
# update-vscode.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "update-vscode.sh - start" "Configuring Visual Studio Code settings"


ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ${DEVELOPER_BIN}/vscode 2> /dev/null

# Copy app preferences
cp -R ${DOTFILES_ROOT}/macos-vscode/vscode-prefs/* $HOME/Library/Preferences

# Copy extensions and other settings to ~/.vscode (first clean it out)
mkdir ${HOME}/.vscode &> /dev/null
rm -Rf ${HOME}/.vscode/* &> /dev/null
cp ${DOTFILES_ROOT}/macos-vscode/vscode-extensions.zip ${HOME}/.vscode/



# ==============================================================================
exit 0
