![Preview](https://dl.dropbox.com/u/732128/vim-screenshot.png)

# Requirements

* for Ubuntu (tested on 12.04) `sudo apt-get install ncurses-term`

# Instalation

1. `git clone https://github.com/reu/vimfiles ~/.vim`
2. `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
3. `echo "source ~/.vim/vimrc" > ~/.vimrc`
4. Run Vim and type `:BundleInstall`
5. Compile vimproc: `cd ~/.vim/bundle/vimproc && make`
