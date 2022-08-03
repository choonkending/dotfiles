return {
  'hrsh7th/nvim-cmp',

  requires = {
    'hrsh7th/cmp-buffer',   -- nvim-cmp source for buffer words
    'hrsh7th/cmp-path',     -- nvim-cmp source for path
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim builtin LSP client
  },

  config = function()
    local cmp = require('cmp')

    cmp.setup({
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' }
      })
    })
  end
}
