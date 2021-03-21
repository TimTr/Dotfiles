# source this file into .zshrc

# Functions to make output attractive when running the script
# NOTE: some characters in the comment will break the function, e.g. "!"
message () { printf "\r  [\033[00;32m $1\033[0m ] $2\n" }
status () { printf "\r  [\033[00;34m $1\033[0m ] $2\n" }
error () { printf "\r  [\033[00;31m $1\033[0m ] $2\n" }
bullet () { printf "\r    - \033[00;32m $1\033[0m \n" }


# Function to find all files recursively under current folder
findall () {
    find ./ -name $1 -print 2> /dev/null
}

# Function to create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}
