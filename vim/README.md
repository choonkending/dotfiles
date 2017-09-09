# vimrc
This is my attempt at creating a simple, minimalistic vimrc with only the plugins
I require and nothing more.

## Instructions

### MacOS

1. `brew install macvim --with-override-system-vim`
2. Download the tomorrow-night theme colours for vim
```bash
curl https://raw.githubusercontent.com/chriskempson/tomorrow-theme/master/vim/colors/Tomorrow-Night.vim --output ~/.vim/colors/tomorrow-night.vim --create-dirs
```
3. Install [vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
4. Copy `.vimrc` into `~/.vimrc` 
5. Open `vim` and run `:PlugInstall`
6. Install YouCompleteMe
```
cd ~/.vim/plugged/YouCompleteMe
./install.py
```

