set nocompatible              " be iMproved, required
filetype detect

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-repeat'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdtree'

call vundle#end()


syntax enable
set number "Numbered lines
" set cursorline " highlight current line
set wildmenu " autocomplete visual 
set showmatch "highlights matching brakets 
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

set ruler
set mouse=a

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Nerd Tree Directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Recover Vim sessions 
map <F2> :mksession! ~/vim_session <cr> 
map <F3> :source ~/vim_session <cr>
