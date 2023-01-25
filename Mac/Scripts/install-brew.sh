#!/bin/zsh
#
# install-brew.sh   -- macOS version
#
# ==============================================================================

# TODO: this is not yet setup for Homebrew, just a copy of Ruby installer!

source ~/.functions

message "install-brew.sh" "Installing Homebrew using default script"

which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Installing for the first time..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  message "Found Homebrew" "Installing critical packages, updating and upgrading..."
  brew install automake bison openssl readline libyaml gdbm libffi wget
  brew update
  brew upgrade
fi


# Try this in the future - uses the API instead of Git checkouts
# export HOMEBREW_INSTALL_FROM_API=1
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


exit 0

