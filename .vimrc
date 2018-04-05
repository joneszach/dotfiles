set nocompatible              " be iMproved, required
filetype off                  " required

inoremap <F9> <Esc>:bprev<CR>
inoremap <F10> <Esc>:bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <F10> :bnext<CR>
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set number
set mouse=a
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
vmap <LeftMouse> <nop>

" Copy-to-clipboard support. On debian I need `vim-gtk` package.
vmap <C-c> "+y
imap <C-c> <Esc>"+yya
nmap <C-c> "+yy

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'

Plugin 'ap/vim-buftabline'

call vundle#end()            " required
filetype plugin indent on    " required

let g:molokai_original = 1
colorscheme molokai " I like this theme.
"colorscheme gruvbox " Not a fan of this theme.
"colorscheme jellybeans " Not a fan of this theme. No color variation.

" Control-/ comments like Sublime Text
nmap <C-_>   <Plug>NERDCommenterToggle
imap <C-_>   <Esc><Plug>NERDCommenterToggle i
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Control-Shift-k line deletion like Sublime Text
nnoremap <C-S-k> "_dd<CR>k
inoremap <C-S-k> <Esc>"_dd<CR>ki

let g:loaded_matchparen=1

