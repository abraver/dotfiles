" ----------------------------------------------------------------------------
"  General
" ----------------------------------------------------------------------------

set modelines=0            " Prevent modelines from being evaluated
set nobackup		   " Don't keep a backup file
set nocompatible	   " Use Vim defaults instead of 100% vi compatibility
set history=50		   " keep 50 lines of command line history
set viminfo='20,\"1000	   " read/write a .viminfo file, don't store more than

" Restore the previous cursor position in the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

filetype plugin on         " enable filetype plugin

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set backspace=indent,eol,start	" more powerful backspacing
set formatoptions+=n       " support for numbered/bullet lists

" ----------------------------------------------------------------------------
"  Remapping
" ----------------------------------------------------------------------------

" lead with ,
let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>


" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

syntax on                  " turn on syntax highlighting
set ruler                  " show the cursor position all the time
set noshowcmd              " don't display incomplete commands
set nolazyredraw           " turn off lazy redraw
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set ch=2                   " command line height
set backspace=2            " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set ignorecase             " ignore case when searching
set smartcase              " ignore case when searching
set hlsearch               " highlight searches
set visualbell             " shut the fuck up

" ---------------------------------------------------------------------------
"  Autocomplete
" ---------------------------------------------------------------------------

set wildmode=longest:full  " Make vim autocompletion more like bash
set wildmenu

" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>
