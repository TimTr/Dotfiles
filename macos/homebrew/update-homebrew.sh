#!/bin/zsh
#
# update-hombebrew.sh

# Source ~/.functions so we have functions like "status" and "message"
source ${HOME}/.functions
status "update-homebrew.sh" "Evaluating the update to Homebrew..."

# ==============================================================================
# Just in case Homebrew isn't installed at all, re-install it
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then

  # Install Homebrew
  message "Installing Homebrew" "First time installing Homebrew..."
  
  # New Bash-based Homebrew installer (doesn't use Ruby)
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  
  # Old Ruby-based installer (supposedly deprecated)
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

else

  message "Updating Homebrew" "Homebrew was already installed"
  brew update

fi


# ==============================================================================
exit 0


