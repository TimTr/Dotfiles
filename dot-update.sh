#!/bin/sh
#
# dot-update
#
# This script handles installation and updates. Run it periodically
# to make sure you're on the latest and to fix any broken settings.

set -e

parentDirectory="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
dotfilesDirectory="$(cd "$( dirname "$parentDirectory" )" && pwd -P)"

export ZSH=$HOME/.dotfiles

# Set macOS defaults
$ZSH/macos/set-defaults.sh

# Install homebrew
$ZSH/homebrew/install.sh 2>&1

# Upgrade homebrew
echo "› brew update"
brew update

# Install software
echo "› $ZSH/script/install"
$ZSH/script/install


# Go into the source `dotfiles` folder to then run all the installers
cd "$(dirname $0)"/..

# find the installers is subfolders and run them iteratively
find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
