# .zshenv - Loaded in every session, even if not interactive
#
# No need to import command prompt, graphics, or other things
# that only apply to interactive shells. Those won't have any
# impact and can just slow down some tools that load this.
# -------------------------------------------------------------

# ==============================================================================
# Hard-coding the PATH in .zshenv so available even to non-interactive shells
# Add the Homebrew paths and custom path first
export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/Linux"
# WAS: export PATH="/opt/homebrew/bin:/usr/local/bin:$HOME/Developer"
# export PATH="/opt/homebrew/bin:/usr/local/bin:/opt/bin"

# Add default system PATHs to the chain (these are REALLY important)
export PATH="$PATH:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin"


# ==============================================================================
# Python3 - Augument the default PATH for Python3 use
export PY_PYTHON=3

# ==============================================================================
# Make VSCode the default editor.
export EDITOR='code';

# end of file
