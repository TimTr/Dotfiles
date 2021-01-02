#!/bin/zsh
#
# update-hombebrew.sh

# Import the default functions used in these scripts
source ${HOME}/.functions
status "update-homebrew.sh" "Updating Homebrew"

# ==============================================================================
# Just in case Homebrew isn't installed at all, re-install it
which -s brew
if [[ $? != 0 ]] ; then

  # Install Homebrew
  status "Installing Homebrew" "First time installing Homebrew..."
  
  # New Bash-based Homebrew installer (doesn't use Ruby)
  sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  
  # Old Ruby-based installer (supposedly deprecated)
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

else

  status "Updating Homebrew" "Homebrew was already installed"
  brew update

fi

# This should have been installed by the initial install script. Mostly a test.
brew update tree


# ==============================================================================
exit 0


