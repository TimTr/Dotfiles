#!/bin/zsh
#
# install-hombebrew.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "install-homebrew.sh" "Setting up Homebrew for the first time"


# ==============================================================================
# Most of the real work occurs in the update file
source $(dirname $0)/update-homebrew.sh



# ==============================================================================
status "install-homebrew.sh - done." "Returning to parent script."
exit 0


