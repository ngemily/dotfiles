Dotfiles
========

This is a collection of my configuration files.  Below is a summary of all setup
required from a new machine (because I'm tired of looking it up).  Used on OS X
and Linux.  I've tried to make the settings as modular possible, ie. vimrc will
try to load powerline, but it won't die if it's not installed (much commenting
out to get things to stop complaining).

Git
---

Summary of ssh key setup.

    ssh-keygen -t rsa -b 4096 -C "$EMAIL"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github_rsa
    curl -u "$EMAIL" --data "{\"title\":\"$TITLE\",\"key\":\"$(cat github_rsa.pub)\"}" https://api.github.com/user/keys
    ssh -T git@github.com

Get the repository

    git clone git@github.com:ngemily/dotfiles.git

Vim 
---

Link vimrc, vim directory

    ln -s $PATH_TO_REPO/vimrc ~/.vimrc
    ln -s $PATH_TO_REPO/vim ~/.vim

Install vundle, then install all plugins.

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

Set make undo directory

    mkdir ~/.vimundo


ZSH
---
Link zshrc, etc.

    ln -s $PATH_TO_REPO/zshrc ~/.zshrc
    ln -s $PATH_TO_REPO/aliases ~/.aliases

Get oh-my-zsh

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Get syntax highlight plugin

    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

Change default shell
    
    chsh -s $(which zsh)

KDE
---
Solarized colorscheme.

    curl -o ~/.kde/share/apps/konsole/solarized_dark.colorscheme https://raw.githubusercontent.com/phiggins/konsole-colors-solarized/master/Solarized%20Dark.colorscheme

TMUX
----
Link tmuxrc

    ln -s $PATH_TO_REPO/tmux.conf ~/.tmux.conf

Powerline
---------

Get pip.
Get powerline.
Get powerline font/symbols.

Link config files

    ln -s $PATH_TO_REPO/powerline ~/.config/powerline

SSH
---

Link config

    ln -s $PATH_TO_REPO/ssh/config ~/.ssh/config

Key setup

    https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2
