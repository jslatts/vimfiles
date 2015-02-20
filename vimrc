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

"turn plugins
syntax on
filetype plugin indent on

"add change paste
nmap <silent> cp "_cw<C-R>"<Esc>

"autocomplete setup
set completeopt=longest,menuone
set ignorecase
set ofu=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


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
