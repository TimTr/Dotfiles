#!/bin/zsh
#
# setup.sh is a filename understood as a startup by GitHub Codespaces and VMs
#
# TODO: add `update` or `install` check to easily update without full re-install


# These scripts all require `zsh` as the default.
# This will set the default shell if needed
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "Requires \"zsh\". Switched default shell to /bin/zsh -- re-run setup.sh file"
  exit 0
fi

# Get the folder in which setup.sh was run, no matter your current location.
# This is then the root from which all further operations are run.
# NOTE: this syntax is `zsh` specific
DOTFILES_HOME=${0:a:h}
DOTFILES_SETUP=${0:a}


# This script will run either the Linux or macOS installer
# (yes, one day may need more options than this, but for now...)
if [[ $OSTYPE == darwin* ]]; then

  source $DOTFILES_HOME/macos/setup-macos.sh
  
else

  source $DOTFILES_HOME/linux/setup-linux.sh
  
fi

exit 0




# ==============================================================================
#
#### Saved script tidbits may want later
#
# -----------------
# This piece of script would require that you launch the setup while
# already located inside the ~/dotfiles folder - this isn't needed
#
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   echo "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi
#
#
# -----------------
# Check if the file exists to enforce install from $HOME/dotfiles
#
# if [[ -f "$HOME/dotfiles/setup.sh" ]]; then
#    echo
# else
#    echo
#    echo "~/dotfiles/setup.sh does NOT exist."
#    echo "You must install \"dotfiles\" at the root of your home folder."
#    echo
#   exit 0
# fi



