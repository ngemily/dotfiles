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

# Programs
alias matlab='matlab -nodesktop -nosplash'
alias jnios='java -jar ~/scripts/jniosemu.jar'

# Utilities
alias lsusb='system_profiler SPUSBDataType'

# Projects and directories
alias me='ftp ngemily2@individual.utoronto.ca'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
