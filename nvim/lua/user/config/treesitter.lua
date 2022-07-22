return {
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup {
      -- A list of parser names, or "all"
      ensure_installed = "all",
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      }
    }
  end
}
