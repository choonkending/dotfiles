-- Reload packages when plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

return require('packer').startup(function()
  -- Packer is a plugin manager
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A file explorer for Neovim written in Lua
  use(require('user.config.nvim-tree'))

  -- Fuzzy file finder
  use(require('user.config.telescope'))

  -- Neovim tree-sitter is a parser generator tool - helps with syntax highlighting
  use(require('user.config.treesitter'))

  -- Language Server Protocol Configs
  use(require('user.config.lsp'))

  -- Completion engine
  use(require('user.config.completion'))

  -- Colour scheme for neovim
  use(require('user.config.rose-pine'))

end)
