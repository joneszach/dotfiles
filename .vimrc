set nocompatible              " be iMproved, required
filetype off                  " required

" Store vim's working files in another directory
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Standard vim options
syntax enable
set showcmd
set formatoptions-=r formatoptions-=c formatoptions-=o
set listchars=space:·,tab:│-
set colorcolumn=80
"set cursorline
set path+=**
set wildmenu
set hlsearch
set ignorecase
set smartcase
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set number
set mouse=a
set backspace=indent,eol,start
set ttimeoutlen=10
set pastetoggle=<F4>
set sessionoptions-=options
set complete-=t
set complete-=i
" Allow pasting of commands starting with : in vim 8
set t_BE=
set updatetime=100
set completeopt+=menuone
set scrolloff=8

""" Custom mappings
" I like vim's mouse mode but I don't want it to click to select
nmap <LeftMouse> <nop>
imap <LeftMouse> <nop>
" Copy-to-system-clipboard support. On debian I need `vim-gtk` package.
vnoremap <C-c> "+y
inoremap <C-c> <Esc>"+yya
nnoremap <C-c> :y+<CR>
" Switch buffers with F9 and F10
inoremap <F9> <Esc>:bprev<CR>
inoremap <F10> <Esc>:bnext<CR>
nnoremap <F9> :bprev<CR>
nnoremap <F10> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <Leader>[ :bprev<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>l :b#<CR>
" Clear the highlight (after searching)
nnoremap <F3> :noh<CR>
" Control-/ comments like Sublime Text
nmap <C-_>   <Plug>NERDCommenterToggle
imap <C-_>   <Esc><Plug>NERDCommenterToggle i
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Show tags in the local file
nnoremap <Leader>r :CtrlPBufTag<CR>
" json pretty printer
nnoremap <leader>json :%!python -m json.tool<CR>
" Delete line of text
nnoremap <leader>d "_dd<CR>k
" Regenerate tags file. A file 'tags' must be present in CWD.
nnoremap <leader>tags :call system('[ -f tags ] && ag -l \| ctags --links=no -L-')<CR>
" Copy entire buffer to system clipboard.
nnoremap <leader>ca :%y+<CR>
nnoremap <leader>ss :set syntax=
nnoremap <leader>ft :set filetype=
" Close buffers more quickly.
nnoremap <silent> <leader>w :bd<CR>
nnoremap <silent> <leader><del> :bd<CR>
cnoremap wq :echo "Don't do that!"<CR>
nnoremap <silent> <leader><ins> :enew<CR>
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <F2> :set list!<CR>
nnoremap <leader>% :MtaJumpToOtherTag<cr>
" Cause every <Space> in insert mode to create a new undo history.
inoremap <Space> <Space><C-g>u
inoremap <Tab> <Tab><C-g>u
inoremap <CR> <CR><C-g>u
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"
nnoremap <leader>tbc 't"+y'b
nnoremap <leader>tby 't"0y'b
nnoremap <F8> :TagbarToggle<CR>
" When jumping to a mark always zz a.k.a. center on that line.
nnoremap <expr> ' printf('`%czz',getchar())
" Drop a mark before jumping to the beginning or end of file.
" Allows you to go back to where you were by jumping to l.
nnoremap <silent> gg mlgg:SignatureRefresh<CR>
nnoremap <silent> G mlG:SignatureRefresh<CR>
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
nnoremap <Leader>f :Ack!<Space>

command -nargs=* Ddgd :exec 'read!ddgd <f-args>' | normal! gg

let g:SignatureMarkTextHLDynamic = 1
let g:polyglot_disabled = ['graphql']
let g:vsc_completion_command = "\<C-N>"
let g:vsc_reverse_completion_command = "\<C-P>"
"let g:AutoPairsMapCR = 0

""" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ap/vim-buftabline'
"Plugin 'sheerun/vim-polyglot'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'vim-python/python-syntax'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'tpope/vim-sleuth'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'maxboisvert/vim-simple-complete'
"Plugin 'alvan/vim-closetag'
Plugin 'valloric/MatchTagAlways'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'nvie/vim-flake8'
"Plugin 'fholgado/minibufexpl.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Various plugin options
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 0
let g:netrw_mousemaps = 0
let python_highlight_all = 1
let g:buftabline_indicators = 1
let g:buftabline_numbers = 1
let g:loaded_matchparen = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_match_window = 'bottom,order:ttb,results:50'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:NERDCreateDefaultMappings = 0
let g:airline_section_z = airline#section#create(['%#__accent_bold#TS%{&tabstop}:SW%{&shiftwidth}:ET%{&expandtab}', ' %3l/%3L', ' %2v'])
let g:sleuth_neighbor_limit = 0
let g:session_autosave_periodic = 1
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:AutoPairsMapSpace = 0
let g:ack_qhandler = "botright copen 30"


" Colorscheme options
set t_Co=256
set background=dark
color PaperColor

" Make the background transparent :)
" (Only if we are not SSH)
if empty($SSH_CLIENT)
    "hi Normal guibg=NONE ctermbg=NONE
end

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
end

autocmd BufNewFile,BufRead *.js.coffee set syntax=coffee

if executable('flake8')
  autocmd BufWritePost *.py call Flake8()
end

" Highlight trailing spaces with red.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  "echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1,'more_events':0}
execute WatchForChanges("*",autoreadargs)

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

