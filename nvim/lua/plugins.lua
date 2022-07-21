-- Reload packages when plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

return require('packer').startup(function()
  -- Packer is a plugin manager
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A file explorer for Neovim written in Lua
  use(require('config.nvim-tree'))

  -- Colour scheme for neovim
  use(require('config.rose-pine'))

end)
