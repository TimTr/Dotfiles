#!/bin/zsh
#
# setup-macos.sh - the macOS version
source "$DOTFILES_ROOT/macos/functions.sh"
echo
status "setup-macos.sh -- setting up for macOS"

## Report that we are in the right source folder for the dotfiles
message "$DOTFILES_ROOT" "Global variable points to source dotfiles folder"

# ==============================================================================
message "Requires SUDO" "Setting source file permissions and ownership"
# chown and chmod all the files before we copy them
sudo chown -R $USER ${DOTFILES_ROOT}/* 2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/* 2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null

# ==============================================================================
message "Setting PATH" "Temporary, the .zshrc will set it permanently"
# For the install to complete, will need this path setup for this session
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# This Homebrew path is used for M1 Macs -- may not be used in the future
export PATH="/opt/homebrew/bin:$PATH"

exit 0
####### ABORTING FOR NOW


# ==============================================================================
message "Copying dotfiles" "Copying the main dotfiles to $HOME"
# Install each of the sub-sections
${DOTFILES_ROOT}/macos-shell/install-shell.sh
${DOTFILES_ROOT}/macos-settings/install-settings.sh
${DOTFILES_ROOT}/macos-xcode/install-xcode.sh
${DOTFILES_ROOT}/macos-vscode/install-vscode.sh
${DOTFILES_ROOT}/macos-homebrew/install-homebrew.sh
${DOTFILES_ROOT}/macos-ruby/install-ruby.sh

# ==============================================================================
# Add a symlink to the dot-update.sh file at the root here
status "Symlink \"dot\"" "Run \"dot\" from PATH to reset settings any time"
rm ${DEVELOPER_BIN}/dot 2> /dev/null
ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot

status "Resetting chmod" "Ensure all scripts are executable (needs sudo)"
sudo chmod -R 777 ${DEVELOPER_BIN}/*

# copy settings to $HOME root
cp ${DOTFILES_ROOT}/macos/settings/gitconfig.dotfile $HOME/.gitconfig
cp ${DOTFILES_ROOT}/macos/settings/gitignore.dotfile $HOME/.gitignore

# copy Terminal and other plists to $HOME/Library/Preferences
cp ${DOTFILES_ROOT}/macos/settings/*.plist $HOME/Library/Preferences

# set the macOS defaults
source ${DOTFILES_ROOT}/macos/settings/defaults-macos.sh


# ==============================================================================
message "NOTE: manually setup Git info (and other personal info) e.g.:"
bullet "git config --global user.name \"Your Name\""
bullet "git config --global user.email \"youremail@yourdomain.com\""

message "Quit and re-launch the terminal -- install will be finished"
bullet "Type \"ruby -v\" to confirm it is running Ruby 3.0 or later"


echo
exit 0



# ==============================================================================
# Saved code in case need later
#
# Ask to enter a key to continue
# read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'
#
# Handle parameters from the command line - e.g. "update"
# if [ "$1" = "install" ]; then
#   echo "\nDOT.SH:  Attempting initial install of the dotfiles..."
#
#
# Diagnostic - delete later
#   echo "$(basename "$PWD")"
#   echo "$PWD"
#
#   First make sure the installer is run from within the ~/dotfiles folder
#   if [ "$PWD" != "$HOME/dotfiles" ]; then
#     echo " - ABORT: You must install from within the ~./dotfiles folder"
#     exit 0
#   fi
# fi


# If there were no parameters, explain how to use the tool
# if [ $# -eq 0 ]; then
#  echo "DOT.SH: Attempting to update (no parameters). Usage syntax:"
#  echo "        - dot.sh reset"
#  echo "        - dot.sh update"
#  echo "        - dot.sh install   (must be run from within ~/dotfiles"
#fi

# If no parameters, or had entered `update` then proceed to update
# if [[ "$1" = "update" || $# -eq 0  ]]; then
#   echo "\nDOT.SH:  Updating..."
#   Verify that the install had previously succeeded
# fi


# First make sure the installer is run from within the dotfiles folder
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   error "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi

