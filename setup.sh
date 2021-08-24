#!/bin/zsh
#
# setup.sh is a filename understood as a startup by GitHub Codespaces and VMs
#
# 1. This ~/dotfiles folder MUST be in the root of the user's home folder
# 2. First verify that `setup.sh` exists in $HOME/dotfiles
# 3. Verify platform being installed is macOS or Linux
#
# TODO: add `update` or `install` check, and OS platform checks


# Check if the file exists - this format of $HOME and inside quotes is needed
if [[ -f "$HOME/dotfiles/setup.sh" ]]; then
    echo
else
    echo
    echo "~/dotfiles/setup.sh does NOT exist."
    echo "You must install \"dotfiles\" at the root of your home folder."
    echo
    exit 0
fi


# This script will run either the Linux or macOS installer
# (yes, one day may need more options than this, but for now...)
if [[ $OSTYPE == darwin* ]]; then

  source $HOME/dotfiles/macos/setup-macos.sh
  
else

  source $HOME/dotfiles/linux/setup-linux.sh
  
fi

exit 0




# ==============================================================================
#
#### Saved script tidbits may want later
#
#
# This piece of script would require that you launch the setup while
# already located inside the ~/dotfiles folder - this isn't needed
#
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   echo "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
#fi
