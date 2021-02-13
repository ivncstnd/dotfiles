""""""""""""""""""""""""""""""""""""""""""""
" => General Config
""""""""""""""""""""""""""""""""""""""""""""
" show num line
set number

" enable syntax highlighting
syntax on

" colorscheme
colorscheme desert

" standard encoding
set encoding=utf8

" 4 space tabs
set tabstop=4

" one tab backspace
set softtabstop=4

" >>, << shifts line 4 space
set shiftwidth=4

" highlights current line
set cursorline

" show bracket match 
set showmatch

" python syntax highlighting
autocmd BufRead,BufNewFile *.py let python_highlight_all=1

" auto indent
set autoindent

" file type plugins
filetype plugin on

" file specific indent
filetype indent on

" persistent 4 space tabs
set expandtab

" intelligent tabs
set smarttab

" search as entering
set incsearch

" highlight searches
set hlsearch

" search case insensitive
set ignorecase

" search case intelligence
set smartcase

"enable folding
set foldmethod=indent
set foldlevel=99

" enable splits
set splitbelow
set splitright

set noswapfile
set nobackup
set lazyredraw
set exrc
set secure

""""""""""""""""""""""""""""""""""""""""""
" => Keybinds
""""""""""""""""""""""""""""""""""""""""""
" quick binds
let mapleader = ","

" quick save
nmap <leader>w :w!<cr>

" clear search highlight
map <silent> <leader><cr> :noh<cr>

" sudo save
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" split movement maps
" move down
nnoremap <C-J> <C-W><C-J>

" move up
nnoremap <C-K> <C-W><C-K>

" move right
nnoremap <C-L> <C-W><C-L>

" move left
nnoremap <C-H> <C-W><C-H>

" enable folding
nnoremap <space> za

""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.pyw,*.c,*.h,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

