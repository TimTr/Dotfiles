#!/bin/zsh
#
# demo-homebrew.sh - the macOS version
#
# This script will install, uninstall, clean, and then re-install a bunch
# of Homebrew formula. This will keep the CPU busy, and shows a lot of activity
# in the Terminal window to show a more generic developer workflow.
#

# Infinite loop...
while true
do

# Install then uninstall wget to show off the terminal
brew install wget
brew install htop
brew install node
brew install nvm
brew install yarn
brew install rbenv
brew install mariadb
brew install postgresql
brew install swift


# Uninstall all the packages
brew uninstall yarn
brew uninstall wget
brew uninstall rbenv
brew uninstall ruby-build
brew uninstall pkg-config
brew uninstall autoconf
brew uninstall mariadb
brew uninstall groonga
brew uninstall node
brew uninstall nvm
brew uninstall libidn2
brew uninstall postgresql
brew uninstall swift
brew uninstall htop
brew uninstall mecab-ipadic
brew uninstall brotli
brew uninstall icu4c
brew uninstall libunistring
brew uninstall msgpack
brew uninstall libuv
brew uninstall ncurses
brew uninstall pcre
brew uninstall gettext
brew uninstall krb5
brew uninstall nghttp2
brew uninstall pcre2
brew uninstall libev
brew uninstall mecab
brew uninstall jemalloc
brew uninstall readline
brew uninstall c-ares
brew uninstall openssl@1.1

# Force uninstall looks like:
# brew uninstall --ignore-dependencies node


# Delete all caches for all the removed packages, then re-do the loop
brew cleanup -s
echo "Press [CONTROL-C] to stop..."
sleep 1

# NOTE: Commout-out the exit command below to turn this into an infinite loop
# exit 0


# end of the infinite loop
done
echo
exit 0


