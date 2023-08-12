-- Reload packages when plugins.lua is updated
vim.cmd([[autocmd BufWritePost plugins.lua PackerCompile]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer is a plugin manager
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- A file explorer for Neovim written in Lua
  use(require('user.config.nvim-tree'))

  -- Fuzzy file finder
  use(require('user.config.telescope'))

  -- Language Server Protocol Configs
  use(require('user.config.lsp'))

  -- Set up Scala metals
  -- Currently this doesn't work when configured through nvim-lspconfig
  use(require('user.config.nvim-metals'))

  -- Completion engine
  use(require('user.config.completion'))

  -- Colour scheme for neovim
  use(require('user.config.rose-pine'))


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
