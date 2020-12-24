# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias reload!='. ~/.zshrc'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# ... Make 'ls' look a lot prettier
alias ls='ls -FG'
alias lsl='ls -loAFGT'

# original color-coded lsl command:  alias lsl='ls -loFGT'
# sorts folders at the top:  ls -la | grep "^d" && ls -la | grep -v "^d"
# NOTE: if you sort you lose the LS coloring in the output (sad face)


# ... Turn off the Quarantine Bit for all files in local folder
alias qbit="xattr -d com.apple.quarantine ./*"

# ... Eject a volume (type the volume name after)
alias eject="hdiutil detach -verbose -force /Volumes/"

# ... Touch the time and date recursively for all files in current folder
alias touchall="find . -exec touch {} \;"

# ... Tell Time Machine to use higher CPU priority until reboot
alias time-machine-fast="sudo sysctl debug.lowpri_throttle_enabled=0"
