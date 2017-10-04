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

#### Ctags

When editing programs, there is often a need to jump to another location, for example, to see how a function is defined. To help, Vim uses a tags file that lists each word you are likely to want, and their locations (file path and line number). Each wanted word is known as a "tag", for example, each function name or global variable may be a tag.

1. `brew install ctags`
2. Copy `.ctags` into `~/.ctags`
3. Navigate to your project folder and run `ctags -R .`
