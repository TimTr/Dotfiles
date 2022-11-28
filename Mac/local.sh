#!/usr/bin/env zsh
#
# Modify this file at your root folder to customize this install
#
# This is the place to put references to SSH keys, GitHub tokens,
# and other personal information that doesn't belong in the ~/dotfiles
# settings due to security concerns.
#

if [[ -v LOADED_LOCAL ]]; then return; fi
export LOADED_LOCAL=true


source $HOME/.aliases
source $HOME/.functions

message "Loading local.sh..." "Customize local tokens, keys, and passwords..."

# ======= CUSTOMIZE ANY LOCAL SETTINGS THAT DON'T BELONG IN GIT BELOW:

# bullet "Enable Swift.org toolchain (installed in /Some/Folder/On/Disk)"
# export SWIFT_TOOLCHAIN=1
# Configure the toolchain somehow

# Obviously, this must be edited ONLY in the local machine
# Do NOT put in a GitHub repo, e.g. the dotfiles repo
bullet "e.g.: Add GitHub personal access token for use with Homebrew and others"
export HOMEBREW_GITHUB_API_TOKEN=EMPTY


# EXAMPLE: This was used during development of the Swift-DocC snippets feature
#
# bullet "Enable Snippets: type \"swift package learn\" within a package"
# export SWIFTPM_ENABLE_SNIPPETS=1



# end of file.

