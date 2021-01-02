#!/bin/zsh
#
# dot-test.sh
# Source in functions such as message, status, error, and bullet
source $PWD/macos-shell/functions.sh

#export the source and destination folders
export DOTFILES_ROOT=$(pwd -P)
export DEVELOPER_HOME=$HOME/Developer
export DEVELOPER_BIN=${DEVELOPER_HOME}/Bin


message "./dot-test.sh" "!! Be sure you ran this file within \"dotfiles\" home"

## Report that we are in the right source folder for the dotfiles
message "DOTFILE_ROOT:" ${DOTFILES_ROOT}

# Install the template (just an example)
${DOTFILES_ROOT}/template/install.sh



status "./dot-test.sh - done." "Exiting.\n"



