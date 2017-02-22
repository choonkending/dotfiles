""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGINS                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'
" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
" Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Quoting/Parenthesizing  made simple
Plug 'tpope/vim-surround'
" Git wrapper
Plug 'tpope/vim-fugitive'
" EditorConfig (file format to maintain consistent coding styles between editors) plugin for Vim
Plug 'editorconfig/editorconfig-vim'

" Technology specific plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'derekwyatt/vim-scala'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               STANDARD VIM SETTINGS                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turns on all enhancements for Vi Improved.
set nocompatible

" Use clipboard as default register
set clipboard=unnamed

" Enable syntax highlighting
syntax enable

set tabstop=2                  " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2               " Number of spacs indented with reindent operations
set expandtab                  " Use spaces instead of tab characters
set nowrap                     " (Dont) wrap the display lines
set number                     " Show line numbers
set hlsearch                   " highlight search results
set ruler                      " Show row and column in status bar
set ignorecase                 " Case insensitive search by default
set smartcase                  " Use case sensitive search if a capital letter is used
set scrolloff=3                " Minimal number of lines to show at top & bottom when scrolling
set cursorline                 " Highlight the line which the cursor is on
set secure                     " Make sure those project .vimrc' are safe
set list                       " Show `listchars` characters
set listchars=tab:=»,trail:·
set warn                       " Give a warning message when a shell command is used while the bugger has been changed
set colorcolumn=81,121         " highlight the 81st column
set autoread                   " When a file has been detected to have been changed outside of Vim, automatically read it again

set splitbelow                 " Split a window below the current one
set splitright                 " Split a window to the right of the current one

set backspace=indent,eol,start " Allow backspace over autoindent, linebreaks, and over the start of insert

" Make vim remember undos, even when the file is closed!
set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo

" Make vim scroll quicker
set ttyfast                     " Indicates a fast terminal connection
set ttyscroll=3                 " Maximum number of lines to scroll the screen
set lazyredraw                  " Stops macros rendering every step

" COLOR!
colorscheme tomorrow-night

" Enable loading of plugin file when a file is edited
filetype plugin on

" FINDING FILES

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildmode=longest:list,full

" Ignore node_modules for searches
set wildignore+=**/node_modules/**


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   CUSTOM                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow " Open Quickfix window after grep

nnoremap <silent> ]b :bnext<CR>            " Map ]b to :bnext
nnoremap <silent> [b :bprevious<CR>        " Map [b to :bprevious

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               PLUGIN CONFIGURATION                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrlp
let g:ctrlp_user_command = [
\   '.git',
\   'cd %s && git ls-files . -co --exclude-standard',
\   'find %s -type f'
\]

" AIRLINE
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1  " Enable the list of buffers

" NERDTree
nmap ,f :NERDTreeToggle
nmap ,F :NERDTreeFind
let g:NERDTreeWinSize = 32

" JSX
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0        " Allow JSX in .js files

