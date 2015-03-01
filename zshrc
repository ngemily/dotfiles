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
export PATH=/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:/Applications/MATLAB_R2012a.app/bin
export PATH=$PATH:/usr/texbin
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library

export MANPAGER="col -b | /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nomod nolist' -"
export M4PATH="$HOME/Library/texmf/tex/latex/Circuit_macros7.3.3"
export TEXMFHOME="$HOME/Library/texmf"
export C="/Users/ngemily/.wine/drive_c/Program Files"

# Aliases
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi
alias less='/usr/share/vim/vim73/macros/less.sh'
alias ql='quick-look'

# Functions
if [ -e ~/.functions ]; then
  source ~/.functions
fi

# Programs
alias matlab='matlab -nodesktop -nosplash'
alias jnios='java -jar ~/scripts/jniosemu.jar'

# Utilities
alias lsusb='system_profiler SPUSBDataType'

# Projects and directories
alias me='ftp ngemily2@individual.utoronto.ca'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
