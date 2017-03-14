
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   source $(brew --prefix)/etc/bash_completion
fi
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
export PS1="\u@\h: \w \[\033[32m\]\$(__git_ps1)\[\033[00m\] \n$ "
