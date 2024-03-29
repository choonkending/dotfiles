return {
  'nvim-tree/nvim-tree.lua',

  requires = { 'nvim-tree/nvim-web-devicons' },

  tag = 'nightly',

  config = function()
    require('nvim-tree').setup()

    local keymap = vim.api.nvim_set_keymap
    local opts = { silent = true, noremap = true }

    -- Set key bindings for nvim tree
    keymap('n', ",f", ":NvimTreeToggle<CR>", opts)
    keymap('n', ",F", ":NvimTreeFindFileToggle<CR>", opts)
  end
}
