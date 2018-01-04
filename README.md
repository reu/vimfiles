# Requirements

- [Editorconfig](http://editorconfig.org/): `brew install editorconfig`

## Python 3
The [deoplete](https://github.com/Shougo/deoplete.nvim) plugin requires vim with Python 3 enabled, and that really complicates the things a bit.

Vim by default comes only with Python 2 support, and to enable Python 3, we have to disable Python 2, as they can't be loaded at the same time. For this reason, some plugins that require Python 2 can't be used.

To install Vim with Python 3 support: `brew install vim --with-python3`

To install MacVim with Python 3 support:
```
brew tap macvim-dev/macvim
brew install --HEAD macvim-dev/macvim/macvim --with-properly-linked-python2-python3
```

You should also set your Python 3 home on your `~/.vimrc` file, and the default pythonx version:

```
set pyxversion=3

" Assuming the Homebrew python 3 installation
set pythonhome=/usr/local/Cellar/python3/3.6.4_1/Frameworks/Python.framework/Versions/3.6
```

# Instalation

1. `git clone https://github.com/reu/vimfiles ~/.vim`
2. `echo "source ~/.vim/vimrc" >> ~/.vimrc`
3. Run Vim and type `:PlugInstall`
