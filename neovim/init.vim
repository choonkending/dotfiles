""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGINS                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" fzf is a general-purpose command-line fuzzy finder
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Autocomplete - YouCompleteMe

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Colourscheme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'


" Calculates the bundle size of from node module
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
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
" AIRLINE

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers

" NERDTree
nnoremap <silent> ,f :NERDTreeToggle<CR>
nnoremap <silent> ,F :NERDTreeFind<CR>
let g:NERDTreeWinSize = 32

" fzf
" Use ripgrep instead of default find command to traverse file system while respecting .gitignore
let $FZF_DEFAULT_COMMAND = '
  \ rg --column --line-number --files --hidden --follow
  \ --glob "!.git" '
" --column            : show column numbers
" --line-number       : show line numbers
" --files             : search each file that would be searched (but don't search)
" --hidden            : search hidden files and directories
" --follow            : follow symlinks
" --glob:   include or exclude files for searching that match the specified glob

" Define command Rg for searching, redefine command if already defined
" It accepts any number of arguments (0, 1, or many), separated by white space
" It calls fzf functions:
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
" - fzf#vim#with_preview([[options], preview window, [toggle keys...]])
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Map Ctrl P to :Files
nnoremap <silent> <C-P> :Files<CR>
" Map ,S to find all instances of current word with Rg search
nnoremap <silent> ,S :Rg <C-R><C-W><CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
" File source complete the files from the buffer path instead of the current directory.
let g:deoplete#file#enable_buffer_path = 1
" Map Tab and Shift + Tab as selection keys in popupmenu-keys
" - pumvisible - Returns non-zero when the popup menu is visible, zero otherwise
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" JSX
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0                        " Allow JSX in .js files

" Asynchronous Lint Engine (ALE)
""""""""""""""""""""""""""""""""""""""""
" Use flow as linter
let g:ale_linters = {
\  'javascript': ['flow']
\}
" Use eslint to fix javascript formatting
let g:ale_fixers = {
\   '*': ['prettier'],
\   'javascript': ['eslint']
\}

let g:ale_fix_on_save = 1     " Fix files automatically on save
let g:ale_sign_column_always = 1 " Keep the sign column open always
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
" Map ]a and ]b to navigate between ale errors
nnoremap <silent> ]a :ALENextWrap<CR>
nnoremap <silent> [a :ALEPreviousWrap<CR>
