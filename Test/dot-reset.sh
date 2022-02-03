#!/bin/zsh
#
# dot-reset.sh -- deletes all installs to try a clean re-install
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

# NOTE: Does not delete the ~/Developer folder in case other stuff is in there

## Report that we are in the right source folder for the dotfiles
message "Installing dotfiles..." "May require SUDO permission..."
status "$DOTFILES_ROOT" "Global variable points to source dotfiles folder"
status "$DEVELOPER_BIN" "Global variable for new files in the PATH"


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
# Uninstall Homebrew - use their script (not the word "uninstall" to end)
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  status "Skipping Homebrew" "Homebrew does not appear to be installed."
else
  status "Removing Homebrew" "Homebrew was already installed. Uninstalling..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
fi



message "dot-reset.sh - done." "Restart Terminal for changes to take effect"

exit 0

