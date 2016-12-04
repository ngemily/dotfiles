# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="alanpeabody"

# Plugins
plugins=(git brew osx rvm ruby gem zsh-syntax-highlighting)

# Shell opts
DISABLE_AUTO_TITLE=true
setopt NO_BEEP

# zsh opts
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

if [ TERM="xterm" ]; then
    export TERM='screen-256color'
fi

# Quick edit zshrc
source $ZSH/oh-my-zsh.sh
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# Export
if [ -e ~/.exports ]; then
  source ~/.exports
fi
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/local/bin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/Applications/MATLAB_R2012a.app/bin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library

export M4PATH="$HOME/Library/texmf/tex/latex/Circuit_macros7.3.3"
export TEXMFHOME="$HOME/Library/texmf"
export C="/Users/ngemily/.wine/drive_c/Program Files"

# Aliases
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi
if [ ! -z $VRT ] ; then
    alias less="$VRT/macros/less.sh"
fi
alias ql='quick-look'

# Functions
if [ -e ~/.functions ]; then
  source ~/.functions
fi

# Programs
alias matlab='matlab -nodesktop -nosplash'
alias jnios='java -jar ~/scripts/jniosemu.jar'
alias vundle='vim +PluginInstall +qall'

# Utilities
alias lsusb='system_profiler SPUSBDataType'
unalias lsusb

# Projects and directories
alias me='ftp ngemily2@individual.utoronto.ca'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

stty intr '^C'
stty erase '^?'
