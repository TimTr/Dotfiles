#!/bin/zsh
#
# dot-install.sh

# export the source folders
export DOTFILES_ROOT=$(pwd -P)

# Source (import) in functions such as message, status, and error
source ${DOTFILES_ROOT}/template/dot-source.sh

echo
message "./dot-install.sh" "!! Be sure you ran this file within \"dotfiles\" home"


# Create the ~/Developer folder, just in case
export DEVELOPER_HOME=$HOME/Developer
export DEVELOPER_BIN=${DEVELOPER_HOME}/Bin
mkdir -p ${DEVELOPER_HOME} 2> /dev/null
mkdir -p ${DEVELOPER_BIN} 2> /dev/null

## Report that we are in the right source folder for the dotfiles
status "Source folder is DOTFILE_ROOT:" ${DOTFILES_ROOT}
status "Destination in PATH is DEVELOPER_BIN:" ${DEVELOPER_BIN}

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
${DOTFILES_ROOT}/macos-homebrew/install-homebrew.sh


# Add a symlink to the dot-update.sh file at the root here
status "[Adding \"dot\"]" "Run \"dot\" from the PATH to reset settings any time"
rm ${DEVELOPER_BIN}/dot 2> /dev/null
ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot
sudo chmod -R 777 ${DEVELOPER_BIN}/*


message "dot-install.sh - done." "Restart Terminal for changes to take effect"

exit 0

