# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Export
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export MANPAGER="col -b | /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nomod nolist' -"

# Aliases
alias ls='ls -aG'
alias less='/usr/share/vim/vim73/macros/less.sh'

# GIT
alias g='git'
alias gst='git status --short'
alias gchd='git checkout dev'
alias gch='git checkout'
alias gcm='git commit -m'
alias gpd='git push origin dev'
alias gld='git pull origin dev'
alias gpo='git push origin'
alias glo='git pull origin'
alias gb='git branch'
alias ga='git add'
alias gd='git diff'
alias gap='git add -p'
alias gd='git diff'

alias gpsh='git push origin'
alias gpl='git pull origin'

alias gsh='git stash'
alias gsha='git stash apply'

alias ribbon='tag --force _ribbon origin/master'
alias catchup='log --patch --reverse --topo-order _ribbon..origin/master'

