# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------

#### Will need to have copied the ~/.aliases file over already.
source $HOME/.aliases
source $HOME/.functions
source $HOME/.exports
source $HOME/.inputrc

# ==============================================================================
# Hard-coding the ~/Developer/Bin folder to lead the PATH
# Add the Homebrew paths and custom path first
export PATH="/opt/homebrew/bin:/usr/local/bin:/opt/bin"
# Add default system PATHs to the chain (these are REALLY important)
export PATH="$PATH:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"
# Add the Xcode tooling folder to PATH
export PATH="$PATH:/Library/Apple/usr/bin"

# This `rbenv` setting needs to be hard-coded into .zshrc by default
eval "$(rbenv init - zsh)"
export PATH="${HOME}/.rbenv/bin:$PATH"

# ==============================================================================
# Custom prompt with newline
NEWLINE=$'\n'
PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"




# ==============================================================================
# Previous iterations of the prompt line
# NEWLINE=$'\n'
# PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"


