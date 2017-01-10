set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

if !has('win32')
  " Fuzzy finder
  Bundle 'ctrlpvim/ctrlp.vim.git'
  " Javascript/JSX syntax highlighting
  Bundle 'pangloss/vim-javascript'
  Bundle 'mxw/vim-jsx'
  " Buffer management/display
  Bundle 'vim-airline/vim-airline'
  Bundle 'vim-airline/vim-airline-themes'
  " Autocomplete for javascript (for YCM)
  Bundle 'marijnh/tern_for_vim'
  " External Syntax
  Bundle 'scrooloose/syntastic'
  " Solarized Theme
  Bundle 'altercation/vim-colors-solarized'
  " Git Gutter
  Plugin 'airblade/vim-gitgutter'
  " Fugitive (git)
  Plugin 'tpope/vim-fugitive.git'
  " Scratch Buffer
  Plugin 'vim-scripts/scratch.vim.git'
  " Writing environment
  Plugin 'junegunn/goyo.vim.git'
  " Vim motion/nav enhnancement
  Plugin 'easymotion/vim-easymotion'
  " Better autocomplete
  Bundle 'valloric/YouCompleteMe'
endif

call vundle#end()
filetype plugin indent on

syntax on

"Set up auto write/reads
augroup save
  au!
  au FocusLost * wall
augroup END
set nohidden

"set nobackup
set noswapfile

"set nowritebackup
set autoread
set autowrite
set autowriteall

"Remove trailing spaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


"persistent-undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

"autocomplete setup
set completeopt=longest,menuone
set noignorecase
set ofu=syntaxcomplete#Complete

if has('gui_running')
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"Set up tern for JS
autocmd FileType javascript setlocal omnifunc=tern#Complete


"Set theme
colorscheme solarized

"Line numbers
set number

"Set tab settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"Minimum window width
set winwidth=85

"Set fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    "set guifont=Menlo\ Regular:h12
    set guifont=Input\ Mono:h13
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

"set leader
let mapleader=";"

"add change paste
nmap <silent> cp "_cw<C-R>"<Esc>

"add search and replace under cursor
nnoremap <leader>s :%s/<C-r><C-w>/

"Switch buffers
noremap <D-}> :bnext<CR>
noremap <D-{> :bprev<CR>
inoremap <D-}> <esc>:bnext<CR>
inoremap <D-{> <esc>:bprev<CR>

"Delete buffer
map <leader>d :bd<cr>

"Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_args = "--babel"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>e :SyntasticCheck<CR>
noremap <leader>m :SyntasticToggleMode<CR>

"Solarized BG toggle
call togglebg#map("<F5>")

"Setup CtrlP mode
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_working_path_mode = 'a'

"Configure code folding
set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=2
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"set airline to show buffers
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

"fix line wrapping for writing mode
set linebreak

"make navigation of wrapped lines tolerable
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"VIM Easy motion config
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
nmap f <Plug>(easymotion-bd-fl)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <leader>j <Plug>(easymotion-j)

