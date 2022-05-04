set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'preservim/nerdtree'
Plugin 'tabnine/YouCompleteMe'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sensible'
Plugin 'morhetz/gruvbox'
call vundle#end()


syntax enable
set number "Numbered lines
set wildmenu " autocomplete visual 
set showmatch "highlights matching brakets 
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

set ruler
set mouse=a
set completeopt-=preview

silent !mkdir ~/.vim/backups
set backup
set backupdir=~/.vim/backups

let g:rainbow_active = 1
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox

set background=dark
set spell spelllang=en_us

" Nerd Tree Directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd vimenter * NERDTree
autocmd BufNewFile,BufRead *.tex set spelllang spell

" Recover Vim sessions 
map <F2> :mksession! ~/vim_session <cr> 
map <F3> :source ~/vim_session <cr>

set mouse+=a

if &term =~ '^screen'
  set ttymouse=xterm2
endif
