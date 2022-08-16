return {
  'williamboman/mason-lspconfig.nvim',

  requires = {
    { 'williamboman/mason.nvim' },
    { 'neovim/nvim-lspconfig' }
  },

  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'sumneko_lua',  -- lua language server
        'metals',       -- scala language server
      },
      -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      automatic_installation = true
    }

  end
}
