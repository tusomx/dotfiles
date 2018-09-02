" Kudzai Tuso (tusomx)
"{{{ Configs for Launch
set nocompatible
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before endif
"}}}

" {{{ General Configs

execute pathogen#infect()
set number relativenumber       "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set virtualedit=all
set hidden                      "Buffers in the background
set encoding=utf-8
syntax on                       "turn on syntax highlighting
let mapleader="\<Space>"        "modifier
set timeout timeoutlen=1500
"set background=dark
colorscheme nova
set mouse=a
set statusline=%<%f\ %h%m%r%=\ %{devnotes#statusline()}\ %-14.(%l,%c%V%)\ %P " Status line format
" no more pesky escape (for insert and visual mode)
imap kj <Esc>
imap kJ <Esc>
imap Kj <Esc>
imap KJ <Esc>
"}}}
"{{{ Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme='molokai'
"}}}
"{{ Powerline
set guifont=Inconsolata\ for\ Powerline:h16
let g:Powerline_symbols = 'fancy'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8 "}}
"{{{Turn Off Swap Files
set noswapfile
set nobackup
set nowb
"}}}

"{{{ Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif
"}}}

"{{{ Folds
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
"}}}

"{{{ Scrolling
set so=8                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
"}}}

"{{{ Searching
set incsearch              " Find the next match as we type the search
set hlsearch               " Highlight searches by default
set ignorecase             " Ignore case when searching...
set smartcase              " ...unless we type a capital

" {{{ Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually

set nowrap                    "Dont wrap lines
set linebreak                 "Wrap lines at convenient points
"}}}

" {{{ Customisation
" ======= Window pane resizing
nnoremap <silent> <Leader>[ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>] :exe "resize " . (winheight(0) * 2/3)<CR>

" ======= Seeing Is Believing Gem=====
" Annotate every line
nmap <leader>b :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;

" Annotate marked lines
nmap <leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;

" Remove annotations
nmap <leader>c :%.!seeing_is_believing --clean<CR>;

"  Mark the current line for annotation
nmap <leader>m A # => <Esc>

"  Mark the highlighted lines for annotation
vmap <leader>m :norm A # => <Esc>

" Other shortcuts
" ====NERDTree======
nnoremap <leader>d :NERDTreeToggle<Enter>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Open NERDTree by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>d :NERDTreeToggle<CR>
"nnoremap <leader>f :NERDTreeFind<CR>

" == Highlights ==
nmap <leader><CR> :nohlsearch<cr>
" == Buffer switching ====
"map <leader>p :bp<CR>
"map <leader>n :bn<CR>
"map <leader>d :bd<CR>
" == No movement using arrow keys ==
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" == Dev Notes ==
map <leader>dn :call DevNotes()<CR>
"}}}
"{{{ Ruby Testing
let test#strategy = "vimux"
" vim-test bindings
nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>
nmap <leader>ts :TestSuite<CR>
nmap <leader>tl :TestLast<CR>
"}}}
"{{{Tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
"}}}
"{{Narrow Region Plugin(NrrwRgn)
nmap <leader>np :NR<CR>
nmap <leader>nw :NW<CR>
"}}
