#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

if [[ -v LOADED_LOCAL ]]; then return; fi
LOADED_LOCAL=true


source $HOME/.aliases
source $HOME/.functions

message "Customize environemnt" "Adding tokens, keys, and passwords..."
bullet "Enable toolchains (installed in /Some/Folder/On/Disk)"
export SWIFT_TOOLCHAIN=1

bullet "Select toolchain ID: XXXXXXX"
# Do something here

bullet "Enable Snippets: type \"swift package learn\" within a package"
export SWIFTPM_ENABLE_SNIPPETS=1

# Obviously, this must be edited ONLY in the local machine
# Do NOT put in a GitHub repo, e.g. the dotfiles repo
bullet "Add GitHub personal access token for use with Homebrew and others"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY

