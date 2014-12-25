# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="alanpeabody"

# Plugins
plugins=(git brew osx rvm ruby gem rails)

# Shell opts
DISABLE_AUTO_TITLE=true
setopt NO_BEEP

if [ TERM="xterm" ]; then
  export TERM='screen-256color-bce'
fi

# Quick edit zshrc
source $ZSH/oh-my-zsh.sh
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# Export
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/scripts:/Applications/MATLAB_R2012a.app/bin:/usr/texbin:~/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/share/python
export MANPAGER="col -b | /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nomod nolist' -"
export M4PATH="$HOME/Library/texmf/tex/latex/Circuit_macros7.3.3"
export TEXMFHOME="$HOME/Library/texmf"
export ANDROID_HOME="/usr/local/opt/android-sdk"
export C="/Users/ngemily/.wine/drive_c/Program Files"

# Aliases
alias ls='ls -aFG'
alias less='/usr/share/vim/vim73/macros/less.sh'
alias python='/usr/local/Cellar/python/2.7.3/bin/python'
alias t='python ~/Repos/t/t.py --task-dir ~/Dropbox/tasks --list tasks'
alias ql='quick-look'
alias termtter='ruby ~/bin/termtter/bin/termtter'
alias skype='skype4cocoa'
alias fbme='fbcmd notices markread'
alias fb='fbcmd'

# GIT
alias g='git'
alias gst='git status --short'
alias gch='git checkout'
alias gcm='git commit -m'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'

# Programs
alias matlab='matlab -nodesktop -nosplash'
alias XP='VBoxManage startvm Windows\ XP'
alias jnios='java -jar ~/scripts/jniosemu.jar'

# Utilities
alias lsusb='system_profiler SPUSBDataType'

# Projects and directories
alias me='ftp ngemily2@individual.utoronto.ca'
alias C='cd ~/.wine/drive_c/Program\ Files'
alias skule='cd ~/Dropbox/My\ Classes'

# Journal
alias jmount='open ~/Documents/Journal.dmg'
alias j='cd /Volumes/Journal'
alias jumount='diskutil umount Journal'

# Config dir; .zsh.d
source ~/.zsh.d/syntax-highlighting/zsh-syntax-highlighting.zsh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:`brew --prefix android-ndk`/toolchains/arm-linux-androideabi-4.4.3/prebuilt/darwin-x86/bin
PATH=$PATH:/usr/local/Cellar/android-ndk/r9c/toolchains/arm-linux-androideabi-4.6/prebuilt/darwin-x86/bin
PATH=$PATH:/Volumes/ECE353/android-kernel-tools/tools

