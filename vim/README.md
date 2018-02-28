# vimrc
:warning: I am moving towards using [neovim](https://neovim.io/), which is a project which seeks to aggressively Vim source code to allow extendibility without the constraints of code dedicated for legacy systems.
Any new changes to the dotfiles for vim will now be in [nvim](https://github.com/choonkending/dotfiles/tree/master/neovim/) section of dotfiles.

This is my attempt at creating a simple, minimalistic vimrc with only the plugins
I require and nothing more.

## Instructions

### MacOS

1. `brew install macvim --with-override-system-vim`
2. Install [vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Copy `.vimrc` into `~/.vimrc`
4. Open `vim` and run `:PlugInstall`
5. Install YouCompleteMe
```
cd ~/.vim/plugged/YouCompleteMe
./install.py
```

