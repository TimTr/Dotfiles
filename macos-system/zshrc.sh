# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------

#### Will need to have copied the ~/.aliases file over already.
source $HOME/.aliases
source $HOME/.functions


#### Ruby - Add rbenv to allow picking a newer Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ... Augument the default PATH for Python use
export PATH="/usr/local/sbin:$PATH"
export PY_PYTHON=3


#### Colors -- usable everywhere now that they are in the .profile, e.g:
#
#   echo -e "$C_GLOW  Do something then add a new-line if want extra space $C_END \n"
#
autoload colors; colors;

export C_GLOW="$fg_bold[cyan]"
export C_GLOW1="$fg_bold[cyan]"
export C_GLOW2="$fg[yellow]"
export C_END="$fg[default]"

#### This is a function you can anywhere
comment () {
    echo -e "\n$C_GLOW1=================================================================="
    for var in "$@"
    do
        echo -e "==$C_GLOW2 $var $C_GLOW"
    done
    echo -e "==================================================================$C_END\n"
}


# ... Syntax coloring for ZSH is a bit different than bash
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex

# ... Custom prompt with newline
NEWLINE=$'\n'
PS1="${NEWLINE}🐛 %F{yellow}%~%{%F{white}%} ▶︎ %{%f%}%"

# Old version, includes current user account
# PS1="${NEWLINE}🐛 %{%F{white}%}[ %F{yellow}%~ %{%F{white}%}] %{%f%}% "
# example - PS1="> %{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{$%f%}%% "
# PS1="${NEWLINE}> %{%F{yellow}%}%n%{%f%} %{%F{white}%}%~ %{%f%}% > "
