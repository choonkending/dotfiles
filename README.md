# README

Hi there! This is just a simple but currated collection of dotfiles.

## Setup

### MacOS

1. Clone repository to your local machine
    ```bash
    git clone git@github.com:choonkending/dotfiles.git
    ```
    
1. Install [HomeBrew](https://brew.sh/) to your machine.
1. Run the install script to set up and copy the necessary dotfiles to your local filesystem
    ```bash
    ./install.sh
    ```
1. Install packages while opening neovim
    ```bash
    nvim +PackerSync
1. Set aliases
    ```bash
    alias vi="nvim"
    alias vim="nvim"
    ```
1. Configure your terminal to use Nerd Fonts, e.g.
    - Iterm: Preferences > Profile > Text > Font > Hack Nerd Font
