set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'mhinz/vim-signify'
Plugin 'itchyny/lightline.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'tabnine/YouCompleteMe'
Plugin 'preservim/nerdtree'
Plugin 'mg979/vim-visual-multi'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Stoozy/vimcord'
Plugin 'simeji/winresizer'
call vundle#end()

syntax enable
set lazyredraw "Dont update screen during macro execution 
set number "Numbered lines
set wildmenu " autocomplete visual 
set showmatch "highlights matching brakets 
set autoindent "New lines inherit the indentation of previous lines
set smarttab " Automatically switch search to case-sensitive when search query contains uppercase
set expandtab "Convert tabs to spaces
set hlsearch "highlight search 
set incsearch "Incremental search showing partial matches
set linebreak "Avoid wrapping a line mid word 
set mouse=a "enable mouse
set completeopt=longest,menuone
set mouse+=a
autocmd FileType latex,tex,md,markdown setlocal spell

" PluginSettings 
set updatetime=100 "vim-signify
let g:indent_guides_enable_on_vim_startup = 1 " vim-index-guides

" Custom CMUS functions 
function s:issue(inp)
        call system('/usr/bin/cmus-remote -C "' . a:inp . '" &')
endfunction

" Bindings of Vim
let mapleader = "<"
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> :q<enter>
nnoremap <C-w> :w<enter>

nnoremap eh :call <SID>issue("player-prev")<enter>
nnoremap ek :call <SID>issue("player-pause")<enter>
nnoremap el :call <SID>issue("player-next")<enter>
nnoremap ed :call <SID>issue("win-remove")<enter>
nnoremap ea :call <SID>issue("win-add-p")<enter>

nnoremap wj :call <SID>issue("win-down")<enter>
nnoremap wk :call <SID>issue("win-up")<enter>
nnoremap wl :call <SID>issue("seek +5")<enter>
nnoremap wh :call <SID>issue("seek -5")<enter>

nnoremap w1 :call <SID>issue("view tree")<enter>
nnoremap w2 :call <SID>issue("view playlist")<enter>
nnoremap wt :call <SID>issue("win-next")<enter>




" Fancy themes 
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Recover Vim sessions 
noremap <F2> :mksession! ~/.cache/vim_session <cr> 
noremap <F3> :source ~/.cache/vim_session <cr>
set dir=~/.cache/





if &term =~ '^screen'
  set ttymouse=xterm2
endif

