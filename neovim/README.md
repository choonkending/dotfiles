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
3. Copy `init.vim` to `~/.config/nvim/init.vim`
```
curl https://raw.githubusercontent.com/choonkending/dotfiles/master/neovim/init.vim --output ~/.config/nvim/init.vim --create-dirs
```
4. Install Python3 for deoplete (if you do not already have it)
```
brew install python3
pip3 install neovim
```
5. Install ripgrep as a search tool
```
brew install ripgrep
```
6. Install Vim Plugins
```js
nvim +PlugInstall
```
7. Add aliases for nvim in your `.zshrc` or `.bashrc` file
```
# Set vim alises
alias vim="nvim"
alias vi="nvim"
```
8. Set nvim as your git core editor
```
git config --global core.editor nvim
```
