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
4. Copy `coc-settings.json` to `~/.config/nvim/coc-settings.json`
```
curl https://raw.githubusercontent.com/choonkending/dotfiles/master/neovim/coc-settings.json --output ~/.config/nvim/coc-settings.json --create-dirs
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

## Configuring Haskell IDE engine for [coc.nvim](https://github.com/neoclide/coc.nvim)

1. Download the source code following [these instructions](https://github.com/haskell/haskell-ide-engine#download-the-source-code)
```
# Ensure stack local bin directory is on your PATH
# If you wish to add it run
# export PATH=$PATH:$(stack path --local-bin)

git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine

# Run stack ./install.hs help for more information
stack ./install.hs stack-build-all
stack ./install.hs build-data
```
