CWD=`pwd`

mkdir ~/.vimundo
mkdir ~/.config
rm -rf ~/.vim
rm -rf ~/.config/powerline

ln -fs ${CWD}/gitconfig ~/.gitconfig
ln -fs ${CWD}/gitignore ~/.gitignore
ln -fs ${CWD}/vimrc ~/.vimrc
ln -fs ${CWD}/vim/ ~/.vim
ln -fs ${CWD}/zshrc ~/.zshrc
ln -fs ${CWD}/aliases ~/.aliases
ln -fs ${CWD}/tmux.conf ~/.tmux.conf
ln -fs ${CWD}/powerline/ ~/.config/powerline
ln -fs ${CWD}/ssh/config ~/.ssh/config

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vim +PluginInstall +qall
