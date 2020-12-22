# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------

#### Will need to have copied the ~/.aliases file over already.
source $HOME/.aliases
source $HOME/.functions

# Hard coding DOTFILES_ROOT to $HOME/Developer/Bin
export DOTFILES_ROOT=$HOME/Developer/Bin

# Hard-coding the ~/Developer/Bin folder to lead the PATH
export PATH="$HOME/Developer/Bin:$PATH"

# Ruby - Add rbenv to allow picking a newer Ruby
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python3 - Augument the default PATH for Python3 use
export PATH="/usr/local/sbin:$PATH"
export PY_PYTHON=3


# Colors -- usable everywhere now that they are in the .zshrc
autoload colors; colors;

# Syntax coloring for ZSH is a bit different than bash
export CLICOLOR=1
export LSCOLORS=gxFxCxDxbxExBxAxaxaxex
# another example for zsh: export LSCOLORS=GxFxCxDxBxexexaxaxaxex

# ... Custom prompt with newline
NEWLINE=$'\n'
PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"
