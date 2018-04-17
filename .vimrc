set nocompatible              " be iMproved, required
filetype off                  " required

" Store vim's working files in another directory
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Standard vim options
syntax enable
set listchars=space:·,tab:│-
set colorcolumn=80
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

""" Custom mappings
" I like vim's mouse mode but I don't want it to click to select
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
" Copy-to-system-clipboard support. On debian I need `vim-gtk` package.
vnoremap <C-c> "+y
inoremap <C-c> <Esc>"+yya
nnoremap <C-c> "+yy
" Switch buffers with F9 and F10
inoremap <F9> <Esc>:bprev<CR>
inoremap <F10> <Esc>:bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <F10> :bnext<CR>
" Clear the highlight (after searching)
nnoremap <F3> :noh<CR>
" Control-/ comments like Sublime Text
nmap <C-_>   <Plug>NERDCommenterToggle
imap <C-_>   <Esc><Plug>NERDCommenterToggle i
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Control-Shift-k line deletion like Sublime Text
nnoremap <C-S-k> "_dd<CR>k
inoremap <C-S-k> <Esc>"_dd<CR>ki
" Show tags in the local file
nnoremap <Leader>r :CtrlPBufTag<CR>
" json pretty printer
nnoremap <leader>json :%!python -m json.tool<CR>
" Delete line of text
nnoremap <leader>d "_dd<CR>k
" Regenerate tags file. A file 'tags' must be present in CWD.
nnoremap <leader>tags :call system('[ -f tags ] && ag -l \| ctags --links=no -L-')<CR>

""" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ap/vim-buftabline'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'vim-python/python-syntax'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'JazzCore/ctrlp-cmatcher'

call vundle#end()            " required
filetype plugin indent on    " required

" Various plugin options
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 1
let g:netrw_mousemaps = 0
let python_highlight_all = 1
let g:buftabline_indicators=1
let g:loaded_matchparen=1
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" Colorscheme options
set t_Co=256
set background=dark
color PaperColor

" Make the background transparent :)
" (Only if we are not SSH)
if empty($SSH_CLIENT)
    "hi Normal guibg=NONE ctermbg=NONE
end

" Highlight trailing spaces with red.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

