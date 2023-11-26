# source this file into .zshrc

if [[ -v LOADED_ALIAS ]]; then return; fi
LOADED_ALIAS=true


# ===========================================
# Aliases

# ... Turn off the Quarantine Bit for all files in local folder
alias qbit="xattr -d com.apple.quarantine ./*"

# ... Eject a volume (type the volume name after)
alias eject="hdiutil detach -verbose -force /Volumes/"

# ... Touch the time and date recursively for all files in current folder
alias touchall="find . -exec touch {} \;"

# ... Tell Time Machine to use higher CPU priority until reboot
alias time-machine-fast="sudo sysctl debug.lowpri_throttle_enabled=0"

# launch the iOS Simulator app from the command line
# you can then type "simulator help" or "simulator list" to see more info
alias simulator="xcrun simctl"

# Recursively remove .DS_Store files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# alias reload!='. ~/.zshrc'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'


# Use 'll' to enable "show all" for hidden files beginning with a period
alias ll='ls -loAFGT'
# Use 'lla' to suppress the "show all" flag when listing files
alias lla='ls -loFGT'
# Use 'llx' to see the most info, including extended attributes
alias llx='ls -lo@AFGT'
# Make standard 'ls' look prettier, with colors and sorting
alias ls='ls -FG'


# Git can sometimes create locked files in the .git folder, which then
# blocks things like compress tasks, or copying files. Run "unlock" to
# unlock all files in the current folder (and recursively)
alias showlocks="find . -flags +uchg"

alias unlock="find . -flags +uchg -exec chflags nouchg {} \;"

# ... echo $SHELL tells you the default shell, this command
#     instead tells you which shell you are presently inside
alias shell-now='ps -p $$'

# original color-coded lsl command:  alias lsl='ls -loFGT'
# sorts folders at the top:  ls -la | grep "^d" && ls -la | grep -v "^d"
# NOTE: if you sort you lose the LS coloring in the output (sad face)

