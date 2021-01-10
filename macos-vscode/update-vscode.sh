#!/bin/zsh
#
# update-vscode.sh

# This script is a little unusual since settings for VS Code are scattered
# around the system. There is a standard .plist in user preferences, which does
# very little. There is also an important ~/Library/Application Support/ folder
# called "Code" which contains a file named ./User/settings.json. This has
# the most interesting settings. Notably, this file will refer to other
# extensions and themes that need to be installed. This script will unzip
# the extensions stored in ~/.vscode so the settings.json and installed
# extensions will match up.
#
# To update the extensions, can just use Finder to zip up the ~/.vscode folder
# any time, and be sure to name the file "vscode-root.zip" and put it back
# into this folder. The script properly unzips, moves, and cleans up.


# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "update-vscode.sh - start" "Configuring Visual Studio Code settings"

# Add an alias so 'vscode' from the command line launches the app
ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ${DEVELOPER_BIN}/vscode 2> /dev/null

# ==============================================================================
# Copy app preferences (this file stores very few settings)
cp ${DOTFILES_ROOT}/macos-vscode/vscode-prefs/com.microsoft.VSCode.plist \
  ${HOME}/Library/Preferences

# Real settings go: $HOME/Library/Application Support/Code/User/settings.json
mkdir -p "${HOME}/Library/Application Support/Code/User"
cp ${DOTFILES_ROOT}/macos-vscode/vscode-prefs/settings.json \
  "${HOME}/Library/Application Support/Code/User/settings.json"


# ==============================================================================
# Clean out the existing .vscode settings
# (setopt turns off zsh complaining when no files match existing in ~.vscode)
setopt +o nomatch
mkdir ${HOME}/.vscode &> /dev/null
rm -Rf ${HOME}/.vscode/* > /dev/null
setopt -o nomatch

# ==============================================================================
# Copy extensions and other settings to ~/.vscode (first clean it out)
# Unzip directly into ~/.vscode
unzip -u ${DOTFILES_ROOT}/macos-vscode/vscode-root.zip -d ${HOME}/.vscode/ &> /dev/null

# Move the files from the vscode-root subfolder to the trunk of ~/.vscode
mv -f ${HOME}/.vscode/vscode-root/* ${HOME}/.vscode/

# Remove the silly __MACOSX folder in case it exists
rm -Rf ${HOME}/.vscode/__MACOSX/
rm -Rf ${HOME}/.vscode/vscode-root/
rm -Rf ${HOME}/.vscode/.DS_Store



# ==============================================================================
exit 0
