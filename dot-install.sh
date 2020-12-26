#!/bin/zsh
#
# dot-install.sh
echo
# Functions to make output attractive when running the script
message () { printf "\r  [\033[00;32m $1\033[0m ] $2\n" }
status () { printf "\r  [\033[00;34m $1\033[0m ] $2\n" }
error () { printf "\r  [\033[00;31m $1\033[0m ] $2\n" }

# First make sure the installer is run from within the dotfiles folder
if [ "$(basename "$PWD")" != "dotfiles" ]; then
  error "ABORT" "You must run the installer from within the dotfiles folder"
  exit 0
fi

# export the home of the dotfiles folder, and the target Developer folders
export DOTFILES_ROOT=$(pwd -P)
export DEVELOPER_HOME=$HOME/Developer
export DEVELOPER_BIN=${DEVELOPER_HOME}/Bin

# Create the ~/Developer folder, just in case
mkdir -p ${DEVELOPER_HOME} 2> /dev/null
mkdir -p ${DEVELOPER_BIN} 2> /dev/null

## Report that we are in the right source folder for the dotfiles
message "Installing dotfiles..." "May require SUDO permission..."
status "$DOTFILES_ROOT" "Global variable points to source dotfiles folder"
status "$DEVELOPER_BIN" "Global variable for new files in the PATH"

# chown and chmod all the files before we copy them
sudo chown -R $USER ${DOTFILES_ROOT}/* 2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/* 2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null

# ==============================================================================
# Install each of the sub-sections
${DOTFILES_ROOT}/macos-shell/install-shell.sh
${DOTFILES_ROOT}/macos-settings/install-settings.sh
${DOTFILES_ROOT}/macos-xcode/install-xcode.sh
${DOTFILES_ROOT}/macos-vscode/install-vscode.sh
${DOTFILES_ROOT}/macos-homebrew/install-homebrew.sh

# Add a symlink to the dot-update.sh file at the root here
status "[SymLink \"dot\"]" "Run \"dot\" from PATH to reset settings any time"
rm ${DEVELOPER_BIN}/dot 2> /dev/null
ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot
sudo chmod -R 777 ${DEVELOPER_BIN}/*


message "dot-install.sh - done." "Restart Terminal for changes to take effect"

exit 0

