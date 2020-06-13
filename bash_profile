# git completion for Mac:
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   source $(brew --prefix)/etc/bash_completion
fi
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

# general git settings:
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\u@\h: \w \[\033[32m\]\$(__git_ps1)\[\033[00m\] \n$ "
export GIT_EDITOR=nano

# a few shortcuts for Ubuntu in WSL2:
alias open="explorer.exe ."
alias winuserdir="cd /mnt/c/Users/maxim/"
