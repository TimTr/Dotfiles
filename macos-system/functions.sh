# source this file into .zshrc

# Setup some colors to make this script look pretty
export C_GLOW="$fg_bold[cyan]"
export C_GLOW1="$fg_bold[cyan]"
export C_GLOW2="$fg[yellow]"
export C_END="$fg[default]"


#### Function to find all files recursively under current folder
#### NOTE: some characters in the comment will break the function, e.g. "!"
comment () {
    echo -e "\n$C_GLOW1=============================="
    for var in "$@"
    do
        echo -e "==$C_GLOW2 $var $C_GLOW1"
    done
    echo -e "==============================$C_END\n"
}

#### Function to find all files recursively under current folder
findall () {
    find ./ -name $1 -print 2> /dev/null
}

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}
