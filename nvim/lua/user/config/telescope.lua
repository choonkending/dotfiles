return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.0',

  -- Depends on ripgrep (installed via HomeBrew) for live_grep and grep_string
  requires = { {'nvim-lua/plenary.nvim'} },

  config = function()
    local keymap = vim.api.nvim_set_keymap
    local opts = { silent = true, noremap = true }

    -- Set key bindings for telescope
    keymap('n', '<C-P>', [[<cmd>Telescope find_files<cr>]], opts)
    keymap('n', '<C-F>', [[<cmd>Telescope live_grep<cr>]], opts)
  end
}
