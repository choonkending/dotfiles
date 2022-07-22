local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal
keymap("n", "]b", ":bnext<CR>", opts)         -- Map ]b to :bnext
keymap("n", "]b", ":bprevious<CR>", opts)     -- Map [b to :bprevious

-- Map Ctrl-direction to window-movement keys for easier navigation
--  C-J: Down
--  C-K: Up
--  C-H: Left
--  C-L: Right
keymap("n", "<C-J>", "<C-W><C-J>", opts)       -- Map Ctrl-J to Ctrl-W Ctrl-J
keymap("n", "<C-K>", "<C-W><C-K>", opts)       -- Map Ctrl-K to Ctrl-W Ctrl-K
keymap("n", "<C-H>", "<C-W><C-H>", opts)       -- Map Ctrl-H to Ctrl-W Ctrl-H
keymap("n", "<C-L>", "<C-W><C-L>", opts)       -- Map Ctrl-L to Ctrl-W Ctrl-L
