return {
  'rose-pine/neovim',

  as = 'rose-pine',

  tag = 'v1.*',

  config = function()
    vim.opt.background = "dark"
    vim.cmd([[colorscheme rose-pine]])
  end
}
