# vimrc
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

