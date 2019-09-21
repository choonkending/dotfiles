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
" Add intellisense engine which provides true snippet and and additional text
" editing support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" JSX
""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0                        " Allow JSX in .js files

" JSON
""""""""""""""""""""""""""""""""""""""""
" Add correct comment highlighting for json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Asynchronous Lint Engine (ALE)
""""""""""""""""""""""""""""""""""""""""
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

" Conquer of Completion (COC)
" Created to have Intellisense like VSCode
""""""""""""""""""""""""""""""""""""""""

" Do not backup a file while we are overwriting a file
" Some LSP servers have issues with backup files, see https://github.com/neoclide/coc.nvim/issues/649
set nobackup
set nowritebackup

set cmdheight=2                 " Set number of screen lines used for command-line
set updatetime=300              " Milliseconds of nothing being typed before the swap file is written to disk
set shortmess+=c                " Don't give Insert Completion Menu messages
set signcolumn=yes              " Always show signcolumn

" Use Tab for trigger completion with characters ahead and navigate
"   inoremap - non-recursive mapping in insert mode (it disallows mapping for
"     <TAB>, to avoid nested and recursive mappings)
"   silent - execute command silently
"   pumvisible - returns non-zero when the popup menu is visible, zero otherwise
"   <expr> - defines that the {lhs} of the mapping will be an expression, and
"   this expression will be used to obtain the {rhs}
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" Shift-Tab will navigate backwards
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  " col('.') - byte index of the column position given the cursor position
  let col = col('.') - 1
  " getline('.') - get line under the cursor
  " =~# - regex matches
  " \s  matches space or tab
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> (enter or return) to confirm completion, Cntrl-G u means break undo
" chain at current position
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
" :call - call a function
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    " Expand word under cursor
    execute 'h '.expand('<cword>')
  else
    " Show documentation of the current word under hover
    call CocAction('doHover')
  endif
endfunction

" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

