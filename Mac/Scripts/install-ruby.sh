#!/bin/zsh
#
# install-ruby.sh   -- macOS version (simple version, installs latest)

source ${HOME}/.functions
message "install-ruby.sh" "Running [brew install ruby] instead of [rbenv]"
bullet "The latest Ruby is installed via this script and put first in PATH"

which -s brew
if [[ $? != 0 ]] ; then
  error "Missing Homebrew" "Must first install Homebrew before installing Ruby"
  exit 0
fi

brew install ruby








# ==============================================================================
## TODO: Prefer to use chruby for supporting multople Ruby versions
# https://github.com/postmodern/chruby


# TODO: install rbenv if not already installed
# Some tips if rbenv refuses to properly install Ruby
#
#     brew uninstall --ignore-dependencies openssl
#
#     rbenv uninstall 2.5.3     (or 3.0.0 or whatever version)
#     rbenv install 2.5.3       (or 3.0.0 etc...)
#
#     export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-gdbm-dir=/opt/local"
#
# ==============================================================================
# which -s rbenv &> /dev/null
# if [[ $? != 0 ]] ; then
#   error "Missing rbenv" "Re-run install-ruby"
#   exit 0
# fi


# First install RBENV so we can easily switch to the new Ruby install
# message "Installing rbenv" "Using Homebrew to install \"rbenv\" tool"
#
# brew install rbenv ruby-build
# brew install rbenv ruby-build rbenv-gemset rbenv-vars rbenv-bundler
# brew upgrade ruby-build

# Install latest version of Ruby
# message "Installing Ruby" "Using \"rbenv\" to install Ruby 3.0.2"
# rbenv install 3.0.2
# rbenv global 3.0.2
#
# bullet "If install fails, try:  brew uninstall --ignore-dependencies openssl"

# ==============================================================================
# Most of the real work occurs in the update file - load it now...
# source $(dirname $0)/update-ruby.sh
#
# message "Ruby install not finished" "Restart Terminal then run \"update-ruby\""
