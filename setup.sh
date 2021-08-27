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
DOTFILES_ROOT=${0:a:h}
DOTFILES_SETUP=${0:a}


# This script will run either the Linux or macOS installer
# (yes, one day may need more options than this, but for now...)
if [[ $OSTYPE == darwin* ]]; then
  source $DOTFILES_ROOT/macos/setup-macos.sh
else
  source $DOTFILES_ROOT/linux/setup-linux.sh
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
#
#
# Ask to enter a key to continue
# read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'
#
# Handle parameters from the command line - e.g. "update"
# if [ "$1" = "install" ]; then
#   echo "\nDOT.SH:  Attempting initial install of the dotfiles..."
#
#
# Diagnostic - delete later
#   echo "$(basename "$PWD")"
#   echo "$PWD"
#
#   First make sure the installer is run from within the ~/dotfiles folder
#   if [ "$PWD" != "$HOME/dotfiles" ]; then
#     echo " - ABORT: You must install from within the ~./dotfiles folder"
#     exit 0
#   fi
# fi


# If there were no parameters, explain how to use the tool
# if [ $# -eq 0 ]; then
#  echo "DOT.SH: Attempting to update (no parameters). Usage syntax:"
#  echo "        - dot.sh reset"
#  echo "        - dot.sh update"
#  echo "        - dot.sh install   (must be run from within ~/dotfiles"
#fi

# If no parameters, or had entered `update` then proceed to update
# if [[ "$1" = "update" || $# -eq 0  ]]; then
#   echo "\nDOT.SH:  Updating..."
#   Verify that the install had previously succeeded
# fi


# First make sure the installer is run from within the dotfiles folder
# if [ "$(basename "$PWD")" != "dotfiles" ]; then
#   error "ABORT" "You must run the installer from within the dotfiles folder"
#   exit 0
# fi


# === Symlink \"dot\"" "Run \"dot\" from PATH to reset settings any time"
# rm ${DEVELOPER_BIN}/dot 2> /dev/null
# ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot




