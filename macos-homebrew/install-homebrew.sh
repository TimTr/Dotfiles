#!/bin/zsh
#
# install-hombebrew.sh

# Source functions.sh so we have functions like "status" and "message"
source ${HOME}/.functions
status "install-homebrew.sh" "Setting up Homebrew for the first time"


# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-shell.sh



# Simple little tool to install by default (mostly to verify success)
brew install tree

# ==============================================================================
status "install-homebrew.sh - done." "Returning to parent script."
exit 0


