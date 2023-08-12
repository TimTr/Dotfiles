#!/bin/zsh
#
# clean.sh   -- simple instructions on how to use these dotfiles
#
# ==============================================================================

# Import the default functions used in these scripts
source ${HOME}/.functions
message "clean.sh" "Reset caches and preferences to default"
# ==============================================================================


# Hide tfolders from being visible in Finder (they still show in Terminal)
chflags hidden ${HOME}/Documents/Insta360/   &> /dev/null
chflags hidden ${HOME}/Documents/Larian\ Studios


