#!/bin/zsh
#
# macos-hombebrew.sh

# Import the default functions used in these scripts
source ${HOME}/.functions
status "macos-homebrew.sh - start" "Setting up Homebrew (or updating)"

# ==============================================================================
# Check if Homebrew is already installed: install if not, update if so
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  status "Installing Homebrew" "First time installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  status "Updating Homebrew" "Homebrew was already installed"
  brew update
fi

# Simple little tool to install by default
brew install tree

# ==============================================================================
status "macos-homebrew.sh - done." "Returning to parent script."
exit 0


