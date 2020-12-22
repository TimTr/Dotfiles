#!/bin/zsh
#
# macos-xcode.sh

# Import the default functions used in these scripts
source ${DOTFILES_ROOT}/template/dot-source.sh



## This sets up the proper color themes folder if doesn't already exist
mkdir -p ${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes 2> /dev/null





# ==============================================================================
status "macos-xcode.sh - done." "Returning to parent script."
exit 0
