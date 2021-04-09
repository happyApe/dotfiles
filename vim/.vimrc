set runtimepath^=~/.vim/bundle/ctrlp.vim
" setup for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_use_caching = 0

let mapleader = " " 
map gA m'ggVG"+y''


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Keep Plugin commands between vundle#begin/end.
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-commentary'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
" fzf finder 
Plugin 'junegunn/fzf',{'do':{->fzf#install()}}
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
set backspace=indent,eol,start

" Shortcutting split navigation,saving key press of W : 
nnoremap <leader>h : wincmd h<CR>
nnoremap <leader>j : wincmd j<CR>
nnoremap <leader>k : wincmd k<CR>
nnoremap <leader>l : wincmd l<CR>


set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent smartindent
set tabstop=4
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

