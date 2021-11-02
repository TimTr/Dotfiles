# GLOBAL ENVIRONMENT VARIABLES
# -------------------------------------

echo ".zshrc:     Setting up .aliases, .functions, and more..."


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
# If you get a "command not found" for rbenv, run `install-ruby`
#
# To read more about installing rbenv see: https://github.com/rbenv/rbenv
eval "$(rbenv init - zsh)"
export PATH="${HOME}/.rbenv/bin:$PATH"
export RBENV_INSTALLED=1
export RUBY_CONFIGURE_OPTS=""
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-gdbm-dir=/opt/local"


# ==============================================================================
# Custom prompt with newline before each new command entry
NEWLINE=$'\n'
PS1="${NEWLINE}%F{blue}[%F{white}%~%{%F{white}%}%F{blue}]%F{cyan}▶︎ %{%f%}%"




# ==============================================================================
# Previous iterations of the prompt line
#
# PS1="${NEWLINE}%F{white} %F{cyan}%~%{%F{white}%} %F{red}▶︎%F{yellow}▶︎ %{%f%}%"
#
# NEWLINE=$'\n'
# PS1="${NEWLINE}%F{white}🐛 [%F{cyan}%~%{%F{white}%}] %{%f%}%"


