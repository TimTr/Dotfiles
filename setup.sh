#!/bin/zsh
#
# setup.sh is a filename understood as a startup by GitHub Codespaces
#
# The logic for the setup works as follows:
#
# 1. This ~/dotfiles folder MUST be in the root of the user's home folder
# 2. First verify if `dot.sh install` or just `dot.sh` was called
#    - Must run with the `dot.sh install` parameter on first run or will abort
#    - The `update` command also works, but is the default
#
# 3. If installing, will need to setup based on platform... (finish this)
#
# TODO: add `update` or `install` check, and OS platform checks
# TODO: support $HOME/dotfiles as the only home folder allowed


# First make sure the installer is located at ~/dotfiles/setup.sh
if [ "$(basename "$PWD")" != "dotfiles" ]; then
 error "ABORT" "You must run the installer from within the dotfiles folder"
fi

# Aborting until get the above check working properly
exit 0
 

# This script will run either the Linux or macOS installer
# (yes, one day may need more options than this, but for now...)
if [[ $OSTYPE == darwin* ]]; then

  echo "Running macOS." ;
  source $PWD/macos/setup-macos.sh
  
else

  echo "Not macOS, so assuming this is version of Linux." ;
  source $PWD/linux/setup-linux.sh
  
fi



# ==============================================================================
exit 0

