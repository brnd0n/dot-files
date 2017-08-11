" File: .vimrc
" Author: Brandon Hildreth

"***************************  SETTINGS  ***************************

" General Settings
set nocompatible        " Make Vim more useful (this is already set when a .vimc
                        "   is present, so this command is actually  not needed)
set number              " Turn on line numbers
set relativenumber      " change line numbers to relative numbers to cursor line
set showcmd             " Show vim commands at the bottom as you type
set showmode            " Displays the current mode at bottom of screen
set laststatus=2        " Always show the status line
set showmatch           " Show matching parenthese
set scrolloff=1         " Always show at least one line above/below cursor
set foldmethod=syntax   " Folding is on, and will follow the file's syntax
"set foldcolumn=3       " The gutter will be larger to disaply the folding levels
autocmd BufWinEnter *  silent! :%foldopen!
                        " Opens all folds when opening a buffer
set wildmenu            " Better command-line tab completion
if v:version >= 703
  set colorcolumn=80    " Vertical column
endif

" Mouse Settings
set mouse=a             " Enable the use of the mouse in normal, visual, insert,
                        "   and command modes
set mousehide           " Hide mouse pointer while typing
set ruler               " Show the line and column number of the cursor 

" Keyboard Settings
set backspace=indent,eol,start  " Allow backspace join lines

" Tab Settings 
set autoindent          " Use previous line's indentation on newline
set expandtab           " Expand tabs to spaces
set tabstop=2           " Control the number of spaces used for a tab
set shiftwidth=2        " Control the number of spaces used for a tab

" Search Settings
set incsearch           " Show search immediately
set hlsearch            " Highlight searches with last used search pattern
set ignorecase          " Case of normal letters is ignored
set smartcase           " Ignore case only when the pattern is lowercase letters

" Color Settings  (Having issues getting this to play nice with xterm...)
syntax enable
set background=dark
colorscheme solarized

"***************************  MAPPINGS  ***************************

""" Following commands useful for quickly editing .vimrc
" Opens my .vimrc for editing (use following map to source and close it)
map <F9> :edit $HOME/.vimrc<CR>
" Source my .vimrc file, then close the buffer
map <F10> :source $HOME/.vimrc<CR>:bd<CR>
" Only source my .vimrc
map <F11> :source $HOME/.vimrc<CR>
" close current buffer
map <F12> :bd<CR>

" Clear highlighting
map <F8> :nohl<CR>

" Toggle relative/actual line numbers
map <F7> :set relativenumber! <CR>

" When entereing/leaving insert mode, relative line numbers are turned off/on
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Necessary for the above autocmd. InsertLeave isn't triggered by <C-C> -___-
map <C-C> <ESC> 

" Do recorded commands
" now you can type 'qq' to start recording and 'q' to stop
" hit ',' to go do the macro you just recorded
nnoremap , @q

" Map Redo (<C-R>) to "U"
nnoremap U <C-R>

" Map Sroll Line Down (<C-E>) to <C-L>
"   Mapping corresponds to scrolling with "L"
nnoremap <C-X> <C-E>

" Map Sroll Line Up (<C-Y>) to <C-H>
"   Mapping corresponds to scrolling with "H"
nnoremap <C-A> <C-Y>

" Map + to comment
"noremap + :s/^/\/\//<CR>

" Map - to uncomment
"noremap - :s/^\/\///<CR>

" Map <Space> to toggle a fold
nnoremap <Space> za

"
vnoremap // y/<C-R>"<CR>

" Exit Insert mode and return to normal mode
imap jk <ESC>
imap kj <ESC>

" Break current line into two (opposite of J)
nnoremap K i<CR>
