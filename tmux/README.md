# tmux.conf
This is my attempt at creating a simple tmux conf that does not conflict with vim-bindings

## Instructions

### MacOS

1. `brew install tmux`
2. `brew install reattach-to-user-namespace` - helps with using Mac OS X Programs `pbpaste` and `pbpaste` under tmux
3. Copy `.tmux.conf` into `~/.tmux.conf`
```bash
curl https://raw.githubusercontent.com/choonkending/dotfiles/master/tmux/.tmux.conf --output ~/.tmux.conf --create-dirs
```
