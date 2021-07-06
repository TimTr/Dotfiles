#!/bin/zsh
#
# The logic for the setup works as follows:
#
# 1. This ~/dotfiles folder MUST be in the root of the user's home folder
# 2. First verify if `dot.sh install` or just `dot.sh` was called
#    - Must run with the `dot.sh install` parameter on first run or will abort
#    - The `update` command also works, but is the default
#
# 3. If installing, will need to setup based on platform
#
# TODO: add `update` or `install` check, and OS platform checks
# TODO: support $HOME/dotfiles as the only home folder allowed

# These scripts all presume `zsh` as the default, will setup as needed
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
  echo "Switched default shell to /bin/zsh -- re-run dot.sh file"
  exit 0
fi

# If there were no parameters, explain how to use the tool
if [ $# -eq 0 ]; then
  echo "DOT.SH: Attempting to update (no parameters). Usage syntax:"
  echo "        - dot.sh reset"
  echo "        - dot.sh update"
  echo "        - dot.sh install   (must be run from within ~/dotfiles"
fi

# If no parameters, or had entered `update` then proceed to update
if [[ "$1" = "update" || $# -eq 0  ]]; then
  echo "\nDOT.SH:  Updating..."
  # Verify that the install had previously succeeded
fi


# Handle parameters from the command line - e.g. "update"
if [ "$1" = "install" ]; then
  echo "\nDOT.SH:  Attempting initial install of the dotfiles..."
  
  # Diagnostic - delete later
  echo "$(basename "$PWD")"
  echo "$PWD"

  # First make sure the installer is run from within the ~/dotfiles folder
  # if [ "$PWD" != "$HOME/dotfiles" ]; then
  #   echo " - ABORT: You must install from within the ~./dotfiles folder"
  #   exit 0
  # fi
fi


# Not yet ready to try the rest of the script...
echo "Exiting during development..."
exit 0



source $PWD/shared/functions.sh

# export the home of the dotfiles folder, and the target Developer folders
export DOTFILES_ROOT=$(pwd -P)


# This script will run either the Linux or macOS installer
# (yes, one day may need more options than this, but for now...)
if [[ $OSTYPE == darwin* ]]; then

  echo "Running macOS." ;
  source $PWD/macos/functions.sh
  
else

  echo "Not macOS, so assuming this is version of Linux." ;
  source $PWD/linux/functions.sh
  
fi



# First make sure the installer is run from within the dotfiles folder
if [ "$(basename "$PWD")" != "dotfiles" ]; then
 error "ABORT" "You must run the installer from within the dotfiles folder"
 exit 0
fi

# Pause and wait for keypress to continue
message "Starting Install..." "Step 1 of installing dotfiles on new machine"
bullet "This creates the folder ~/Developer/Bin and puts it in the PATH"
bullet "After this completes, you must quit and restart Terminal"
bullet "Then, in the new Terminal window, run \"dot\" to finish the install"
bullet "You can then re-run \"dot\" at any time to reset the config"
echo
read -s -k $'?Press any key to continue. Hit Control-C to abort now.\n'



## Report that we are in the right source folder for the dotfiles
message "Installing dotfiles..." "May require SUDO permission..."
status "$DOTFILES_ROOT" "Global variable points to source dotfiles folder"
status "$DEVELOPER_BIN" "Global variable for new files in the PATH"


# ==============================================================================
# chown and chmod all the files before we copy them
sudo chown -R $USER ${DOTFILES_ROOT}/* 2> /dev/null
sudo chmod -R 777 ${DOTFILES_ROOT}/* 2> /dev/null

# Un-set the quarantine bit for all my own script files
xattr -d com.apple.quarantine ${DOTFILES_ROOT}/* 2> /dev/null


# ==============================================================================
# For the install to complete, will need this path setup for this session
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# This Homebrew path is used for M1 Macs -- may not be used in the future
export PATH="/opt/homebrew/bin:$PATH"


# ==============================================================================
# Install each of the sub-sections
${DOTFILES_ROOT}/macos-shell/install-shell.sh
${DOTFILES_ROOT}/macos-settings/install-settings.sh
${DOTFILES_ROOT}/macos-xcode/install-xcode.sh
${DOTFILES_ROOT}/macos-vscode/install-vscode.sh
${DOTFILES_ROOT}/macos-homebrew/install-homebrew.sh
${DOTFILES_ROOT}/macos-ruby/install-ruby.sh


# ==============================================================================
# Add a symlink to the dot-update.sh file at the root here
status "Symlink \"dot\"" "Run \"dot\" from PATH to reset settings any time"
rm ${DEVELOPER_BIN}/dot 2> /dev/null
ln -s ${DOTFILES_ROOT}/dot-update.sh ${DEVELOPER_BIN}/dot

status "Resetting chmod" "Ensure all scripts are executable (needs sudo)"
sudo chmod -R 777 ${DEVELOPER_BIN}/*



# ==============================================================================
message "dot-install.sh - Install step 1 done." "Restart Terminal, then:"
bullet "Type \"ruby -v\" to confirm it is running Ruby 3.0 or later"
bullet "Type \"dot\" in Terminal to finish the install"
bullet "Then quit and re-launch Terminal.app -- install will be finished"
echo

# ==============================================================================
exit 0

