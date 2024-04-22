# .zshenv - Loaded in every session, even if not interactive
#
# No need to import command prompt, graphics, or other things
# that only apply to interactive shells. Those won't have any
# impact and can just slow down some tools that load this.
# -------------------------------------------------------------

# Adding the Dotfiles/Mac folder to PATH, as well as Homebrew
export PATH="$DOTFILES_ROOT/Linux:/opt/homebrew/bin"

# Setting for Apple silicon version of Ruby. Pre-pend it and Gems to the PATH
export PATH=$PATH:/opt/homebrew/opt/ruby/bin
export PATH=$PATH:`gem environment gemdir`/bin

# Add default system PATHs at end of the chain
export PATH="$PATH:/usr/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"

# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3


# end of file
