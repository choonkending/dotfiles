return require('packer').startup(function()
  -- Packer is a plugin manager
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A file explorer for Neovim written in Lua
  use(require('config.nvim-tree'))

end)
