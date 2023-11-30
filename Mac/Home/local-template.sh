#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

# Only load this file once per session
if [[ -v LOADED_LOCAL ]]; then return; fi

export LOADED_LOCAL=true
message "Loading local.sh..." "Set local Swift toolchain, keys, and passwords..."

source $HOME/.aliases
source $HOME/.functions

# To use the latest custom installed toolchain from Swift.org
#
#  Enable latest Swift.org toolchain in /Library/Developer/Toolchains/"
#  export TOOLCHAINS=swift ("swift" = use Swift.org tools, empty = use Xcode)
export TOOLCHAINS=


# This must be edited ONLY in the local machine. Do not commit to a repo!
bullet "e.g.: Add GitHub personal access token for use with Homebrew and others"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY



# bullet "Enable Snippets: type \"swift package learn\" within a package"
# export SWIFTPM_ENABLE_SNIPPETS=1



# end of file.

