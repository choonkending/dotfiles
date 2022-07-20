-- -------------------------------
-- Standard Neovim Settings     --
-- -------------------------------
local set = vim.opt

-- Use clipboard as default register
set.clipboard= 'unnamed'

set.tabstop = 2                  -- Number of spaces that a <Tab> in the file counts for
set.shiftwidth = 2               -- Number of spacs indented with reindent operations
set.expandtab = true             -- Use spaces instead of tab characters
set.number = true                -- Show line numbers
set.ignorecase = true            -- Case insensitive search by default
set.smartcase = true             -- Use case sensitive search if a capital letter is used
set.scrolloff = 3                -- Minimal number of lines to show at top & bottom when scrolling
set.cursorline = true            -- Highlight the line which the cursor is on
set.secure = true                -- Make sure those project .nvimrc' are safe
set.list = true                  -- Show `listchars` characters
set.warn = true                  -- Give a warning message when a shell command is used while the bugger has been changed
set.colorcolumn = "81,121"       -- highlight the 81st column
set.autoread = true              -- When a file has been detected to have been changed outside of Vim, automatically read it again
set.shortmess = "I"              -- Don't give an intro message when starting vim
set.listchars = "tab:=»,trail:·"
set.termguicolors = true         -- Enables 24-bit RGB colour in Terminal UI

set.splitbelow = true            -- Split a window below the current one
set.splitright = true            -- Split a window to the right of the current one

-- Make vim remember undos, even when the file is closed!
set.undofile = true              -- Save undo's after file closes
set.undolevels = 1000            -- How many undos
set.undoreload = 10000           -- number of lines to save for undo
