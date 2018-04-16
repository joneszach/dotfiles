set nocompatible              " be iMproved, required
filetype off                  " required

" Switch buffers with F9 and F10
inoremap <F9> <Esc>:bprev<CR>
inoremap <F10> <Esc>:bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <F10> :bnext<CR>

syntax enable
set cursorline
set path+=**
set wildmenu
set hlsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set number
set mouse=a
set backspace=indent,eol,start
set ttimeoutlen=10
" Allow pasting of commands starting with : in vim 8
set t_BE=
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
"vmap <LeftMouse> <nop>

" Copy-to-system-clipboard support. On debian I need `vim-gtk` package.
vmap <C-c> "+y
imap <C-c> <Esc>"+yya
nmap <C-c> "+yy

let g:netrw_mousemaps = 0
let python_highlight_all = 1

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>

" Control-/ comments like Sublime Text
nmap <C-_>   <Plug>NERDCommenterToggle
imap <C-_>   <Esc><Plug>NERDCommenterToggle i
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Highlight trailing spaces with red.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'kien/ctrlp.vim'
"Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'dracula/vim'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'chriskempson/base16-vim'

Plugin 'ap/vim-buftabline'
"Plugin 'Yggdroot/indentLine'

Plugin 'pangloss/vim-javascript'
Plugin 'vim-python/python-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1

set t_Co=256
"set termguicolors
"let g:molokai_original = 1
colorscheme molokai " I like this theme.
"colorscheme gruvbox " Not a fan of this theme.
"colorscheme jellybeans " Not a fan of this theme. No color variation.
"color dracula
set background=dark
color PaperColor

" Make the background transparent :)
" (Only if we are not SSH)
if empty($SSH_CLIENT)
    "hi Normal guibg=NONE ctermbg=NONE
end

"set laststatus=2
"set statusline=%f:%L\ %y%m%r%h%w\%=[%{&ff}]\ [%p%%]\ [%04l,%04v]

" Control-Shift-k line deletion like Sublime Text
nnoremap <C-S-k> "_dd<CR>k
inoremap <C-S-k> <Esc>"_dd<CR>ki

let g:buftabline_indicators=1

let g:loaded_matchparen=1
let g:indentLine_char = '⎸'

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("ag . --silent -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("ag . --silent -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("ag . --silent -l -g ''", ":sp")<cr>
