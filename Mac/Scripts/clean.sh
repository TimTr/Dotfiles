#!/bin/zsh
#
# clean.sh   -- simple instructions on how to use these dotfiles
#
# ==============================================================================

# Import the default functions used in these scripts
source ${HOME}/.functions
message "clean.sh" "Reset caches and preferences to default"
# ==============================================================================


# Hide the ~/Documents/Insta360/ folder from Finder, if present
chflags hidden ${HOME}/Documents/Insta360/   &> /dev/null



