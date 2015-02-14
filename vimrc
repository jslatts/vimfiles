"Load pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"add change paste
nmap <silent> cp "_cw<C-R>"<Esc>

"Set theme
colorscheme solarized

"Line numbers
set number

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
