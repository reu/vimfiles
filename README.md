# Instalation

1. `git clone https://github.com/reu/vimfiles ~/.vim`
2. `echo "source ~/.vim/vimrc" >> ~/.vimrc`
3. Run Vim and type `:PlugInstall`
4. If using neovim, on `~/.config/nvim/init.vim`:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
