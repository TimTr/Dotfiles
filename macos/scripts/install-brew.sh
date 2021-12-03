#!/bin/zsh
#
# install-brew.sh   -- macOS version
#
# ==============================================================================

# TODO: this is not yet setup for Homebrew, just a copy of Ruby installer!




# Import the default functions used in these scripts
source ${HOME}/.functions
status "install-ruby.sh" "Configuring app and tool settings"
  
# ==============================================================================
# This script will install Ruby, rbenv, and Jekyll (blogging platform)
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing Homebrew" "Must first install Homebrew before installing Ruby"
  exit 0
fi

# TODO: install rbenv if not already installed
which -s rbenv &> /dev/null
if [[ $? != 0 ]] ; then
  error "Missing rbenv" "Re-run install-ruby"
  exit 0
fi




# First install RBENV so we can easily switch to the new Ruby install
status "Installing rbenv" "Using Homebrew to install \"rbenv\" tool"
# brew install rbenv ruby-build
brew install rbenv ruby-build rbenv-gemset rbenv-vars rbenv-bundler
brew upgrade ruby-build

# Install latest version of Ruby
status "Installing Ruby" "Using \"rbenv\" to install Ruby 3.0.2"
rbenv install 3.0.2
rbenv global 3.0.2

bullet "If install fails, try:  brew uninstall --ignore-dependencies openssl"



# ==============================================================================
# Most of the real work occurs in the update file - load it now...
# source $(dirname $0)/update-ruby.sh


status "Ruby not finished" "Must restart Terminal then run update-ruby"
