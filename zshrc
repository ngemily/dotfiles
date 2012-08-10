# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="alanpeabody"

# Plugins
plugins=(git brew osx rvm ruby gem rails3 rails)

# Quick edit zshrc
source $ZSH/oh-my-zsh.sh
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'

# Export
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export MANPAGER="col -b | /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nomod nolist' -"

# Aliases
alias ls='ls -aG'
alias less='/usr/share/vim/vim73/macros/less.sh'

# Redirect vim to Mvim
alias vim='mvim -v'
alias gvim='mvim'

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

# Current proj
alias proj='cd ~/Repos/VirtualPet/app'

# Journal
alias jmount='open ~/Documents/Journal.dmg'
alias j='cd /Volumes/Journal'
alias jumount='diskutil umount Journal'
