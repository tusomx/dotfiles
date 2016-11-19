" Kudzai Tuso (tusomx)
"{{{ Configs for Launch
call pathogen#infect()                      " use pathogen
set nocompatible
" }}}
"{{{ Colors
syntax enable "enable syntax processing
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
" }}}
"{{{ Minibuffer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" }}}
"{{{ Misc
let g:rails_default_file='config/database.yml' " Change which file opens after executing :Rails command
set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" }}}
"{{{ UI 
set number " show line numbers
set showcmd " show command in bootm bar
set cursorline "highlight current line
filetype indent on " load filetype specific indent files
set wildmenu "visual autocomplete for command menu
set lazyredraw " only redrwa when we need
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set nolist
set ruler  " Ruler on
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line
set mouse=a
" }}}
"{{{ Searching
set incsearch "search as characters are entered
"set hlsearch "highlight matches
" }}}
"{{{ Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nmap ; :
nnoremap B ^
nnoremap E $
" highlight last inserted text
nnoremap gV `[v`]
" " $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}
"{{{ Spaces and tabs
set ts=2 " Tabs are 2 spaces
set tabstop=2 "number of visual space per TAB
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab " tabs are spaces
set colorcolumn=+1
set wrap
" }}}
"{{{ Keyboard Shortcuts
let mapleader = "\<Space>"
nnoremap <leader>s :mksession<CR> " save session
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>p :set invpaste<CR>
nnoremap <leader>w :StripWhitespace<CR>
nnoremap <leader>h :ToggleWhitespace<CR>
" }}}
"{{{ TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
"{{{ Autogroups
augroup configgroup
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
augroup END
" }}}
"{{{ Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
"{{{ Folding
" "=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
 " }}}

 " vim:foldmethod=marker:foldlevel=0
