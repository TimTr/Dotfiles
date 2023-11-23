# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------

#### Will need to have copied the ~/.aliases file over already.
source $HOME/.aliases
source $HOME/.functions

# ==============================================================================
# Hard-coding the ~/Developer folder to lead the PATH
# Do NOT append the previous $PATH as this will duplicate with each script run
export PATH="$HOME/Developer"
# Add the Homebrew alternate folder to PATH
export PATH="$PATH:/opt/homebrew/bin"
# Add default system PATHs to the chain (these are REALLY important)
export PATH="$PATH:/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# Add the Xcode tooling folder to PATH
export PATH="$PATH:/Library/Apple/usr/bin"

# This needs to be hard-coded into .zshrc by default
# eval "$(rbenv init - zsh)"
# export PATH="${HOME}/.rbenv/bin:$PATH"


# ==============================================================================
# Python3 - Augument the default PATH for Python3 use
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
