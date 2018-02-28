# neovim

## Instructions

### macOS

1. Install neovim
```
brew install neovim
```
2. Install [vim-plug](https://github.com/junegunn/vim-plug) - a minimalist Vim plugin manager
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
3. Create config file for nvim
```
mkdir -p ~/.config/nvim/
```
4. Copy `init.vim` to `~/.config/nvim/init.vim`
```
cp init.vim ~/.config/nvim/init.vim
```
5. Install Python3 for deoplete (if you do not already have it)
```
brew install python3
pip3 install neovim
```

6. Install Vim Plugins
```js
nvim +PlugInstall
```
