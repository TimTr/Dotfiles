#!/bin/zsh
#
# dot-source.sh

# Source this file in to get functions and aliases setup

# Functions to make output attractive when running the script
message () { printf "\r  [\033[00;32m $1\033[0m ] $2\n"
}
status () { printf "\r  [\033[00;34m $1\033[0m ] $2\n"
}
error () { printf "\r  [\033[00;31m $1\033[0m ] $2\n"
}


