# dotfiles

Welcome 👋 This repository contains configurations (dotfiles, set up scripts, etc) and documentation for setting up a new environment. While it is opinionated, ever-changing & customised, I welcome any feedback & contributions 🙇‍♂️.

This setup is _**only for macOS**_.

> [!NOTE]
> While I prefer self-explanatory code and "codifying intent", in this repository the scripts and instructions are intentionally **heavily** commented to explain intent. I do not think it is worth the additional layer of abstraction in bash to explain what each flag means.

## Instructions

### General 🏠

This section contains set up instructions for general purpose development and usage of a Mac machine.

1. Set up SSH keys and connect to GitHub

- **Purpose**: To access and write to repositories in GitHub using SSH (Secure Shell Protocol). Using the SSH protocol, you can connect and authenticate to remote servers and services.
- Resources:
  - [📖 Generate SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  - [📖 Add to GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

2. Clone this repository to your local directory

- **Purpose**: Cloning to your local directory will make the code in this repository available for you to execute.
- Copy and paste the following code into your terminal. If you get prompted to download XCode Developer Tools, please accept it.

```
git clone git@github.com:choonkending/dotfiles.git
```

3. Install Homebrew to your machine

- **Purpose**: Homebrew allows you to install the stuff you need which Apple didn't. It is a pre-requisite for the installation scripts to work.
- Follow the instructions in [Homebrew page](https://brew.sh) to install the latest Homebrew.

4. Install applications using brew bundle

> [!NOTE]
> Please change the JDK version in the Brewfile if required

- **Purpose**: Install the default (opinionated) applications and tools that have been defined in the Brewfile.
- Navigate to the directory where you cloned the dotfiles and run the following instructions

```
# Navigate to directory of dotfiles
cd /path/to/dotfiles/

# Run brew bundle
brew bundle
```

5. Install [docker desktop](https://docs.docker.com/desktop/setup/install/mac-install/) on Mac

6. Set default git configurations (set username, email etc)

```
./configure_git.sh
```

7. Set aliases for git in your shell

- Open your shell configuration file .zshrc

```
vim ~/.zshrc
```

- Copy and paste the following aliases into the .zshrc file

```
alias ga="git add"
alias gst="git status"
alias glgg="git log --graph"
alias gd="git diff"
alias gdca="git diff --cached"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
```
- Execute the changes

```
source ~/.zshrc
```

8. [Optional] - Set the installed applications as your default

- **Purpose**: Make it easier for your workflow

### Instructions for Neovim

Prerequisite: You have completed the instructions in [#General](#general)

1. Set `vi` and `vim` to open neovim in your shell

- Open your shell configuration file `.zshrc`

```
vim ~/.zshrc
```
- Copy and paste the following code into the .zshrc file

```
alias vi="nvim"
alias vim="nvim" 
```
- Execute the changes

```
source ~/.zshrc
```
2. Configure neovim using the instructions in LazyVim [here](https://www.lazyvim.org/installation)

