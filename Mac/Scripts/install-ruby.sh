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

