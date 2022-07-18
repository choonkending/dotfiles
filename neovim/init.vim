""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGINS                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Telescope is a fuzzy finder over lists
" Plenary is a required dependency for telescope & provides lua functions for use
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
" Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Quoting/Parenthesizing  made simple
Plug 'tpope/vim-surround'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Vim commentary
Plug 'tpope/vim-commentary'
" EditorConfig (file format to maintain consistent coding styles between editors) plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Colourscheme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            STANDARD NEOVIM SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use clipboard as default register
set clipboard=unnamed

set tabstop=2                  " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2               " Number of spacs indented with reindent operations
set expandtab                  " Use spaces instead of tab characters
set nowrap                     " (Dont) wrap the display lines
set number                     " Show line numbers
set ignorecase                 " Case insensitive search by default
set smartcase                  " Use case sensitive search if a capital letter is used
set scrolloff=3                " Minimal number of lines to show at top & bottom when scrolling
set cursorline                 " Highlight the line which the cursor is on
set secure                     " Make sure those project .vimrc' are safe
set list                       " Show `listchars` characters
set warn                       " Give a warning message when a shell command is used while the bugger has been changed
set colorcolumn=81,121         " highlight the 81st column
set autoread                   " When a file has been detected to have been changed outside of Vim, automatically read it again
set shortmess=I                " Don't give an intro message when starting vim
set listchars=tab:=»,trail:·

set splitbelow                 " Split a window below the current one
set splitright                 " Split a window to the right of the current one

" Make vim remember undos, even when the file is closed!
set undofile                    " Save undo's after file closes
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

" COLOR!
set background=dark
colorscheme vim-monokai-tasty

let g:vim_monokai_tasty_italic = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   CUSTOM                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace on save
" Note: Remove this if you edit files which require trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

autocmd QuickFixCmdPost *grep* cwindow            " Open Quickfix window after grep

nnoremap <silent> ]b :bnext<CR>                   " Map ]b to :bnext
nnoremap <silent> [b :bprevious<CR>               " Map [b to :bprevious
nnoremap <silent> ]c :cnext<CR>                   " Map ]c to :cnext
nnoremap <silent> [c :cprevious<CR>               " Map [c to :cprevious

" Map Ctrl-direction to window-movement keys for easier navigation
" C-J: Down
" C-K: Up
" C-H: Left
" C-L: Right
nnoremap <C-J> <C-W><C-J>                         " Map Ctrl-J to Ctrl-W Ctrl-J
nnoremap <C-K> <C-W><C-K>                         " Map Ctrl-K to Ctrl-W Ctrl-K
nnoremap <C-H> <C-W><C-H>                         " Map Ctrl-H to Ctrl-W Ctrl-H
nnoremap <C-L> <C-W><C-L>                         " Map Ctrl-L to Ctrl-W Ctrl-L

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN CONFIGURATION                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin - AIRLINE

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers

" Plugin - NERDTree
nnoremap <silent> ,f :NERDTreeToggle<CR>
nnoremap <silent> ,F :NERDTreeFind<CR>
let g:NERDTreeWinSize = 32

" Plugin - Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Map Ctrl P to find files
nnoremap <silent> <C-P> <cmd>Telescope find_files<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
