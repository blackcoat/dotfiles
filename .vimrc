" Cheat Sheet
" ===========
" <A> Alt
" <S> Shift
" <C> Control
" <D> Command (or apple key on Macs)
" <M> Meta (Windows key)
"
" <CR> Carriage Return (Enter)
" <C-O> switch to normal mode for the following alias command
" <left>, <right>, <up>, <down> arrow keys

" GENERAL SETUP
" -------------
set nocompatible    " Use vim commands instead of `vi` commands
syntax enable
set clipboard=unnamed " Copy things to the OSX native clipboard!

" Pathogen
" Load plugins installed in  ~/.vim/bundle
call pathogen#infect()
call pathogen#helptags()

" Note that I have the 'sensible' plugin installed, so you don't see
" many settings here that are normally set in other .vimrc's

" Encoding
set encoding=utf-8
set enc=utf-8
filetype plugin indent on

" UI
set hidden          " hides buffers when switching files instead of closing them
set relativenumber  " Number lines relative to the cursor's position
set showmode	    " displays the current vim mode
set title           " changes the terminal's title
set list            " shows invisible characters in the 'listchars' setting
set synmaxcol=800   " don't try to highlight long lines. Taken from mislav
set cursorline      " highlight line where cursor is pointing
set wildmode=list:full


" Shows the file encoding in the status bar
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Color Scheme
" For color reference, see: http://www.pixelbeat.org/docs/terminal_colours/
highlight SpecialKey ctermfg=225 ctermbg=231


" Typing
set copyindent    " Copies the previous indentation when autoindenting
set expandtab     " Convert tabs to spaces
set noesckeys
set nowrap
set shiftwidth=2
set softtabstop=2
set visualbell

" Search + Replace
set gdefault      " assume the /g flag on :s substitutions to replace all matches in a line
set hlsearch      " Highlight search results
set smartcase     " Case-insensitive search if your term is lower cased; otherwise, case-sensitive
set ic

" History
set undolevels=500 " Same, but with things remembered by undo command

" Backups and Swap Files
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" Leaders
" Change leader key from backslash (\) to comma (,)
let mapleader=","
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>G<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <leader>l :set list!<CR>
nnoremap <esc> :noh<CR><esc>
inoremap jk <Esc>
inoremap kj <Esc>

