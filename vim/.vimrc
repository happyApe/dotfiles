let mapleader = " " 
map gA m'ggVG"+y''
set nocompatible              " be iMproved, required
filetype off                  " required

" fast scrolling
set ttyfast
set lazyredraw

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Keep Plugin commands between vundle#begin/end.
Plugin 'Valloric/YouCompleteMe'
Plugin 'mbbill/undotree'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-commentary'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
" fzf finder 
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


set ignorecase 
set smartcase

" let g:gruvbox_italic=1
" colorscheme peachpuff
syntax on
set background=dark
highlight Comment ctermfg=DarkGreen


set mouse=a
set number 
set relativenumber
set encoding=utf-8

" Shortcutting split navigation,saving key press of W : 
nnoremap <leader>h : wincmd h<CR>
nnoremap <leader>j : wincmd j<CR>
nnoremap <leader>k : wincmd k<CR>
nnoremap <leader>l : wincmd l<CR>

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap [ [<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent smartindent
set backspace=indent,eol,start
set nomodeline
set nowrap
    
set spelllang=en_us         " spell checking
set hidden
set nobackup
set nowritebackup
set noswapfile

set magic
set hlsearch
set incsearch

set title
set esckeys

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
map <silent> \ :silent nohlsearch<CR>

" Jump to definition using YCM
nnoremap ,jd :YcmCompleter GoToDefinition<CR>
nnoremap ,jl :YcmCompleter GoToDeclaration<CR>

" YCM will auto-close the preview window after the user leaves insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1



"Append template to new C++ files
" Template can be found at my dotfiles repo inside the templates folder
autocmd BufNewFile *.cpp 0r ~/dotfiles/templates/template.cpp

" Undo tree panel toggle
nnoremap <F5> :UndotreeToggle<CR>

" For Python 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" These are my keys to compile and run c++ file

" F6 compiles without warning and without using address sanitizer from stdinput
" (Don't use this unless you have to, always use address sanitizer)
noremap <F6> <ESC> :w <CR> :!g++ -g -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
inoremap <F6> <ESC> :w <CR> :!g++ -g -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%< <CR>

" F7 compiles without warning and with input file called as inp
noremap <F7> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp<CR>
inoremap <F7> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>

" F8 compiles with warnings from input file called as inp
noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%< < inp<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>

" F9 compiles without warning and without input file i.e from stdinput
noremap <F9> <ESC> :w <CR> :!g++ -g -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
inoremap <F9> <ESC> :w <CR> :!g++ -g -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

" Undo file : Maintain undo history between sessions
" Create a directory first -> 
" mkdir ~/.vim/undodir
set undofile
set undodir=~/.vim/undodir

