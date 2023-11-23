#!/bin/zsh

if [[ -v LOADED_FUNCTIONS ]]; then return; fi
LOADED_FUNCTIONS=true


# Functions to make output attractive when running the script
#
# NOTE: some characters in parameters will not work, e.g. "!"
#
# `message` and `error` take two string parameters
message () { printf "\r [\033[00;32m $1\033[0m ] $2\n" }
error ()   { printf "\r\033[00;31m ** $1\033[0m - \033[00;31m$2 \033[0m \n" }

# `alert` and `bullet` take one parameter
alert ()  { printf "\r\033[00;35m >> $1\033[0m \n" }
bullet ()  { printf "\r\033[00;36m   ==\033[0m $1\n" }


# ... Find all files recursively under current folder
commands () {
    message ".functions" "****************************************"
    echo
    more ~/.functions
    
    message ".aliases" "****************************************"
    echo
    more ~/.aliases
}


# ... Find all files recursively under current folder
findall () {
    find ./ -name $1 -print 2> /dev/null
}


# ... Create a new directory and enter it
md() {
    mkdir -p "$@" && cd "$@"
}


# Delete Xcode derived data
xcode-clean() {
    echo "Deleting all Xcode derived data..."
    rm -rdf ~/Library/Developer/Xcode/DerivedData/*
}

