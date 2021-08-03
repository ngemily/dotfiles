# path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export GEM_HOME="$HOME/.gem/ruby/2.7.0/bin"
export PATH="$GEM_HOME:$PATH"

# manpager
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# fzf
export FZF_DEFAULT_OPTS="--no-bold --color=light,pointer:4,fg+:0,hl:3,info:10,bg+:3,hl+:8,marker:0,pointer:0,prompt:12"
export FZF_CTRL_T_OPTS="
--no-height
--preview '(
file {} | grep ASCII > /dev/null && (pygmentize {} 2> /dev/null || head -n 80 {}) ||
file {} | grep directory > /dev/null && tree {} | head -n 80 ||
file {}
)'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"

# powerline
export POWERLINE_INSTALL="$HOME/.local/lib/python3.8/site-packages/powerline"
