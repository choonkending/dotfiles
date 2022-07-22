return {
  'williamboman/nvim-lsp-installer',

  requires = { 'neovim/nvim-lspconfig' },

  config = function()
    require("nvim-lsp-installer").setup {
      -- automatically detect which servers to install (based on which servers are set up via lspconfig)
      automatic_installation = true
    }

    -- Mappings
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    local lsp_buf = vim.lsp.buf

    -- :help vim.diagnostics.* for more info
    --    space e shows diagnostics in a floating window
    keymap('n', '<space>e', vim.diagnostic.open_float, opts)
    --    [d moves to previous diagnostic in the current buffer
    keymap('n', '[d', vim.diagnostic.goto_prev, opts)
    --    [d moves to next diagnostic in the current buffer
    keymap('n', ']d', vim.diagnostic.goto_next, opts)
    --    space q adds buffer diagnostics to the location list
    keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings
      -- See `help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      keymap('n', 'gD', lsp_buf.declaration, bufopts)
      keymap('n', 'gd', lsp_buf.definition, bufopts)
      keymap('n', 'K', lsp_buf.hover, bufopts)
      keymap('n', 'gi', lsp_buf.implementation, bufopts)
      keymap('n', '<C-k>', lsp_buf.signature_help, bufopts)
      keymap('n', '<space>wa', lsp_buf.add_workspace_folder, bufopts)
      keymap('n', '<space>wr', lsp_buf.remove_workspace_folder, bufopts)
      keymap('n', '<space>wl', function()
        print(vim.inspect(lsp_buf.list_workspace_folders()))
      end, bufopts)
      keymap('n', '<space>D', lsp_buf.type_definition, bufopts)
      keymap('n', '<space>rn', lsp_buf.rename, bufopts)
      keymap('n', '<space>ca', lsp_buf.code_action, bufopts)
      keymap('n', 'gr', lsp_buf.references, bufopts)
      keymap('n', '<space>f', lsp_buf.formatting, bufopts)
    end

    require'lspconfig'.metals.setup{}
  end
}
