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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/scripts:/Applications/MATLAB_R2012a.app/bin:/usr/texbin:~/bin:/usr/local/share/npm/bin:/usr/local/sbin
export MANPAGER="col -b | /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nomod nolist' -"
export M4PATH="$HOME/Library/texmf/tex/latex/Circuit_macros7.3.3"
export TEXMFHOME="$HOME/Library/texmf"
export ANDROID_HOME="/usr/local/opt/android-sdk"

# Aliases
alias ls='ls -aG'
alias less='/usr/share/vim/vim73/macros/less.sh'
alias vim='mvim -v'
alias gvim='mvim'
alias python='/usr/local/Cellar/python/2.7.3/bin/python'
alias t='python ~/Repos/t/t.py --task-dir ~/Dropbox/tasks --list tasks'
alias ql='quick-look'
alias termtter='ruby ~/bin/termtter/bin/termtter'
alias skype='skype4cocoa'
alias fbme='fbcmd notices markread'
alias fb='fbcmd'

# GIT
alias g='git'
alias gitx='nocorrect gitx'
alias gst='git status --short'
alias gchd='git checkout dev'
alias gch='git checkout'
alias gcm='git commit -m'
alias gpo='git push origin'
alias glo='git pull origin'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gap='git add -p'
alias gd='git diff'

# Programs
alias matlab='matlab -nodesktop -nosplash'
alias XP='VBoxManage startvm Windows\ XP'
alias jnios='java -jar ~/scripts/jniosemu.jar'

# Utilities
alias lsusb='system_profiler SPUSBDataType'

# Projects and directories
alias fits='ftp tymagni2@colorfits.com'
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
PATH=$PATH:/Volumes/ECE353/android-kernel-tools/tools
