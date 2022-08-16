return {
  'hrsh7th/nvim-cmp',

  requires = {
    'hrsh7th/cmp-buffer',       -- nvim-cmp source for buffer words
    'hrsh7th/cmp-path',         -- nvim-cmp source for path
    'hrsh7th/cmp-nvim-lsp',     -- nvim-cmp source for neovim builtin LSP client
    'L3MON4D3/LuaSnip',         -- Snippet Engine for Neovim written in Lua
    'saadparwaiz1/cmp_luasnip'  -- luasnip completion source for nvim-cmp
  },

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- Copied from https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end
      },
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

      })
    })
  end
}
