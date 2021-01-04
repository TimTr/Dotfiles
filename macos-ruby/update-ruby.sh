#!/bin/zsh
#
# update-ruby.sh
#
# Import the default functions used in these scripts
source ${HOME}/.functions
status "update-ruby.sh" "Checking current installs of \"brew\" and \"rbenv\""

# If rbenv isn't already installed, add following to the .zshrc file
if [[ -v RBENV_INSTALLED ]]; then

  bullet "RBENV_INSTALLED = $RBENV_INSTALLED - already installed"

else

  bullet "RBENV_INSTALLED = $RBENV_INSTALLED - not installed, adding to .zshrc"
 
  echo '\n# ============================================================' >> ${HOME}/.zshrc
  echo '# Adding support for RBENV to the .zshrc file' >> ${HOME}/.zshrc
  echo ' ' >> ${HOME}/.zshrc
  echo 'eval "$(rbenv init - zsh)"' >> ${HOME}/.zshrc
  echo 'export PATH="${HOME}/.rbenv/bin:$PATH"' >> ${HOME}/.zshrc
  echo 'export RBENV_INSTALLED=1' >> ${HOME}/.zshrc

fi


# ==============================================================================
CURRENT_RUBY=$(ruby -v 2> /dev/null)
bullet "Ruby Version = ${CURRENT_RUBY}"



# ==============================================================================
# This script will install Ruby, rbenv, and Jekyll (blogging platform)
which -s brew &> /dev/null
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing Homebrew" "Re-run dot-install.sh"
  exit 0
fi

which -s rbenv &> /dev/null
if [[ $? != 0 ]] ; then
  # Install Homebrew
  error "Missing rbenv" "Re-run dot-install.sh"
  exit 0
fi


# ==============================================================================
# Install some gems (Jekyll and Bundler to start) spawned from new shell
# The new shell allows the rbenv environment to be setup, so the new
# Ruby install is what is used, rather than the system Ruby that doesn't
# allow the user to install their own gems (write protected system)
which -s bundler &> /dev/null
if [[ $? != 0 ]] ; then
  bullet "Installing Bundler" "Installing the Bundler gem for the first time"
  gem install bundler
else
  message "Updating Bundler" "Updating the Bundler gem to latest version"
  gem update bundler
fi

which -s jekyll &> /dev/null
if [[ $? != 0 ]] ; then
  bullet "Installing Jekyll" "Installing the Jekyll gem for the first time"
  gem install jekyll
else
  bullet "Updating Jekyll" "Updating the Jekyll gem to latest version"
  gem update jekyll
fi




# ==============================================================================
exit 0


