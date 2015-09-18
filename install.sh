CWD=`pwd`
ln -fs ${CWD}/gitconfig ~/.gitconfig
ln -fs ${CWD}/gitignore ~/.gitignore
ln -fs ${CWD}/vimrc ~/.vimrc
rm -r ~/.vim
ln -fs ${CWD}/vim/ ~/.vim
ln -fs ${CWD}/zshrc ~/.zshrc
ln -fs ${CWD}/aliases ~/.aliases
ln -fs ${CWD}/tmux.conf ~/.tmux.conf
rm -r ~/.config/powerline
ln -fs ${CWD}/powerline/ ~/.config/powerline
ln -fs ${CWD}/ssh/config ~/.ssh/config
