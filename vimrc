"Load vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Define bundles
Bundle 'gmarik/vundle'
Bundle 'ctrlpvim/ctrlp.vim.git'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'valloric/YouCompleteMe'
Bundle 'bling/vim-airline'

"turn on plugins
syntax on
filetype plugin indent on

"Set up auto write/reads
augroup save
  au!
  au FocusLost * wall
augroup END
set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall

"persistent-undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000 

"Disable macvim key mappings
if has("gui_macvim")
  macmenu Window.Select\ Next\ Tab key=<nop>
  macmenu Window.Select\ Previous\ Tab key=<nop>
endif

"autocomplete setup
set completeopt=longest,menuone
set ignorecase
set ofu=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"set airline to show buffers
let g:airline#extensions#tabline#enabled = 1

"Set theme
colorscheme solarized

"Line numbers
set number

"Set tab settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"Set fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"set leader
let mapleader=";"

"add change paste
nmap <silent> cp "_cw<C-R>"<Esc>

"Switch buffers
noremap <D-}> :bnext<CR>
noremap <D-{> :bprev<CR>
inoremap <D-}> <esc>:bnext<CR>
inoremap <D-{> <esc>:bprev<CR>

"Delete buffer
map <leader>d :bd<cr> 
