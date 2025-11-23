" Basic Settings

set nocompatible              " Disable Vi compatibility
set number                    " Show line numbers
set showmode                  " Show current mode
set showcmd                   " Show command in status line
set mouse=a                   " Enable mouse support
set encoding=utf-8            " UTF-8 encoding
set t_Co=256                  " 256-color support
filetype plugin indent on     " Enable filetype detection and indentation
set autoindent                " Auto indent new lines
set ignorecase                " Search with case ignored
set smartcase                 " Smart case search
set noerrorbells              " Disable error bells
set autoread                  " Auto reload file if changed externally
set clipboard=unnamedplus     " Use system clipboard
set cursorline                " Highlight current line
set expandtab                 " Use spaces instead of tabs
set tabstop=4                 " Number of spaces per tab
set shiftwidth=4              " Number of spaces for auto-indent
set softtabstop=4             " Number of spaces for editing
syntax enable                 " Enable syntax highlighting
" Set tab, auto-indent etc. for C/C++
autocmd FileType c,cpp,h setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

"Shortcuts to boost OI programming, commented cuz temporarily don't need it
" nnoremap <F5> :w<CR>:!g++ -g % -o %:r && lldb %:r<CR>
" nnoremap <F6> :w<CR>:!lldb %:r<CR>
" nnoremap <F4> :w<CR>:!g++ -g % -o %:r<CR>

call plug#begin('~/.vim/plugged')

" Completion and LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax checking and linting
Plug 'dense-analysis/ale'

" Status line
Plug 'vim-airline/vim-airline'

call plug#end()

" Faster completion and diagnostics update
set updatetime=300
autocmd CursorHold * silent! CocActionAsync('highlight')

" Linting
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'cpp': ['gcc', 'clang'],
\   'c': ['gcc', 'clang'],
\   'java': ['javac']
\}

" Auto fixers
let g:ale_fixers = {
\   'python': ['black', 'isort'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\   'java': ['google-java-format']
\}

" Let pyright use Conda environment
autocmd FileType python let g:python_path = system("conda run -n myenv which python | tr -d '\n'")
autocmd FileType python call coc#config('python.pythonPath', g:python_path)

" Highlight optimization for Coc.nvim

" Color for errors, warnings and hints
highlight CocErrorSign   ctermfg=Red   guifg=#FF5555
highlight CocWarningSign ctermfg=Yellow guifg=#F1FA8C
highlight CocHintSign    ctermfg=Cyan  guifg=#8BE9FD
highlight CocInfoSign    ctermfg=Blue  guifg=#6272A4

" Make floating windows clearer
highlight CocFloating    guibg=#282A36 guifg=#F8F8F2
highlight CocFloatingBorder guifg=#50FA7B

" Boost contrast for Pmenu
highlight Pmenu        guibg=#282A36 guifg=#F8F8F2
highlight PmenuSel     guibg=#44475A guifg=#F8F8F2
highlight PmenuSbar    guibg=#44475A
highlight PmenuThumb   guibg=#50FA7B

" Fix on save
let g:ale_fix_on_save = 1

" Airline's status line
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = airline#section#create(['branch', 'readonly', 'filename'])


" ==========================
" --- CoC completion logic ---
" ==========================

" Use Tab for snippets or to navigate completion items
inoremap <silent><expr> <Tab>
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>" :
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use Shift-Tab to go backward in completion
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use Enter to confirm selection, only if an item is explicitly selected
inoremap <silent><expr> <CR>
      \ pumvisible()
      \ ? (get(coc#pum#info(), 'index', -1) >= 0
      \    ? coc#pum#confirm()
      \    : "\<CR>")
      \ : "\<CR>"

" Check backspace function
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
