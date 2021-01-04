#!/bin/zsh
#
# macos-ruby.sh


# Import the default functions used in these scripts
source ${HOME}/.functions
status "install-ruby.sh" "Configuring app and tool settings"

# ==============================================================================
# Adding rbenv support to the .zshrc file
echo '\n# ============================================================' >> ${HOME}/.zshrc
echo '# Adding support for RBENV to the .zshrc file' >> ${HOME}/.zshrc
echo ' ' >> ${HOME}/.zshrc
echo 'eval "$(rbenv init - zsh)"' >> ${HOME}/.zshrc
echo 'export PATH="${HOME}/.rbenv/bin:$PATH"' >> ${HOME}/.zshrc
echo 'export RBENV_INSTALLED=1' >> ${HOME}/.zshrc
  
  
# ==============================================================================
# This script will install Ruby, rbenv, and Jekyll (blogging platform)
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing Homebrew" "Must first install Homebrew before installing Ruby"
  exit 0
fi


# First install RBENV so we can easily switch to the new Ruby install
status "Installing rbenv" "Using Homebrew to install \"rbenv\" tool"
brew install rbenv ruby-build
brew upgrade ruby-build

# Install latest version of Ruby (currently set to version 3.0.0)
status "Installing Ruby" "Using \"rbenv\" to install Ruby 3.0.0"
rbenv install 3.0.0
rbenv global 3.0.0



message "Ruby not finished" "Must restart Terminal then run dot-update.sh"
bullet "rbenv doesn't take effect until Terminal restarts"
bullet "One restarted, run dot-update.sh or just \"dot\" to install gems"



# ==============================================================================
exit 0


