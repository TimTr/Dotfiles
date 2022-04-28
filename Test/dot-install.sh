#!/bin/zsh
#
# dot-install.sh
echo THIS FILE IS BADLY OUT OF DATE FOR USEFUL TESTING

source $PWD/macos-shell/functions.sh
echo

# First make sure the installer is run from within the dotfiles folder
if [ "$(basename "$PWD")" != "dotfiles" ]; then
 error "ABORT" "You must run the installer from within the dotfiles folder"
 exit 0
fi

# Pause and wait for keypress to continue
message "Starting Install..." "Step 1 of installing dotfiles on new machine"
bullet "This creates the folder ~/Developer/Bin and puts it in the PATH"
bullet "After this completes, you must quit and restart Terminal"
bullet "Then, in the new Terminal window, run \"dot\" to finish the install"
bullet "You can then re-run \"dot\" at any time to reset the config"
echo
read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'


# export the home of the dotfiles folder, and the target Developer folders
export DOTFILES_ROOT=$(pwd -P)

# ==============================================================================
# chown and chmod all the files before we copy them
sudo chown -R $USER ${DOTFILES_ROOT}/* 2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/* 2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null


# ==============================================================================
# For the install to complete, will need this path setup for this session
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# This Homebrew path is used for M1 Macs -- may not be used in the future
export PATH="/opt/homebrew/bin:$PATH"


# ==============================================================================
# Install each of the sub-sections - NOTE: THIS IS BROKEN
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



# ==============================================================================
message "dot-install.sh - Install step 1 done." "Restart Terminal, then:"
bullet "Type \"ruby -v\" to confirm it is running Ruby 3.0 or later"
bullet "Type \"dot\" in Terminal to finish the install"
bullet "Then quit and re-launch Terminal.app -- install will be finished"
echo

# ==============================================================================
exit 0

