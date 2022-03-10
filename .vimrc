set nocompatible              " be iMproved, required
filetype detect

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'codota/tabnine-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-syntastic/syntastic'
" Plugin 'frazrepo/vim-rainbow'
Plugin 'morhetz/gruvbox'
call vundle#end()


syntax enable
set number "Numbered lines
" set cursorline " highlight current line
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

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
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
