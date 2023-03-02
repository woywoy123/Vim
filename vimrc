set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" GruvBox Theme 
Plugin 'gruvbox-community/gruvbox'

" Spell check library
Plugin 'inkarkat/vim-ingo-library' | Plugin 'inkarkat/vim-SpellCheck' 

" Automatically clear search highlights after you move your cursor.
Plugin 'haya14busa/is.vim'
Plugin 'haya14busa/vim-asterisk'

" Automatically adjust tab based on file 
Plugin 'tpope/vim-sleuth'

" Show git file changes in the gutter.
Plugin 'mhinz/vim-signify'

" A git wrapper.
Plugin 'tpope/vim-fugitive'

" Dim paragraphs above and below the active paragraph.
Plugin 'junegunn/limelight.vim'

" Automatically show Vim's complete menu while typing.
Plugin 'vim-scripts/AutoComplPop'

" Languages and file types
Plugin 'godlygeek/tabular' | Plugin 'tpope/vim-markdown'
Plugin 'vim-python/python-syntax'

Plugin 'tabnine/YouCompleteMe'
Plugin 'Stoozy/vimcord'

call vundle#end()

" Set Behaviour 
set autoindent
set autoread
set clipboard=unnamedplus,unnamed
set completeopt=menuone,longest
set hlsearch "highlight search 
set number "Numbered lines
set cursorline
set wildmenu 
set expandtab
set mouse=a
set linebreak
set showmatch
set laststatus=2
set ruler
set encoding=UTF-8
syntax on

" ------------------ GruvBox ------------------
colorscheme gruvbox
set background=dark
hi Visual cterm=NONE ctermfg=None ctermbg=237 guibg=#3a3a3a
" ---------------------------------------------


" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" ------------------ Show the Git Branch on Status bar -------------- 
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'
  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()
" ------------------------------------------------------------------ 

" ----------------- Spelling ------------------
" Enable spelling 
set complete+=kspell
set nospell
set spelllang=en_us

" Toggle spell check 
nnoremap <F5> :setlocal spell!<CR>
inoremap <F5> :setlocal spell!<CR>

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline 
hi SpellLocal cterm=underline
hi SpellRare cterm=underline 
hi SpellCap cterm=underline 
" ---------------------------------------------

" ---------------- Sessions -------------------
call mkdir($HOME . "/.vim/sessions", "p")
noremap <F2> :mksession! ~/.vim/sessions/session <cr> 
noremap <F3> :source ~/.vim/sessions/session <cr>
" ---------------------------------------------

" --------------- Vim-Asterisk ---------------- 
let g:asterisk#keeppos = 1
map * <Plug>(asterisk-z*)<Plug>()
" ---------------------------------------------

" ---------------- LimeLight ------------------ 
let g:limelight_conceal_ctermfg=244
" --------------------------------------------- 

" ---------------- VimSignify ------------------ 
" default updatetime 4000ms is not good for async update
set updatetime=100
" --------------------------------------------- 

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Custom CMUS functions 
function s:issue(inp)
    call system('/usr/bin/cmus-remote -C "' . a:inp . '" &')
endfunction

function s:save()
    call system('/usr/bin/cmus-remote -C "save -e -l -p -q ~/.config/cmus/bkp.cmus" &')
endfunction

function s:load()
    call system('/usr/bin/cmus-remote -C "load ~/.config/cmus/bkp.cmus" &')
endfunction

function s:delete()
    call <SID>issue("view playlist") 
    call <SID>issue("win-sel-cur")
    call <SID>issue("player-play")
    call <SID>issue("win-remove")
endfunction

function s:res()
    let l= substitute(system('/usr/bin/cmus-remote -Q | grep file | cut -d " " -f 2- &'), '\n$', '', '')
    call <SID>issue("view playlist")
    call <SID>issue("add -p " . l)
    call <SID>issue("add -q " . l)
endfunction


" Bindings of Vim
nnoremap eh :call <SID>issue("player-prev")<enter>
nnoremap ek :call <SID>issue("player-pause")<enter>
nnoremap el :call <SID>issue("player-next")<enter>
nnoremap ed :call <SID>delete()<enter>
nnoremap er :call <SID>res()<enter>
nnoremap ea :call <SID>issue("win-add-p")<enter>

nnoremap fs :call <SID>save()<enter>
nnoremap fr :call <SID>load()<enter>

nnoremap wj :call <SID>issue("win-down")<enter>
nnoremap wk :call <SID>issue("win-up")<enter>
nnoremap wl :call <SID>issue("seek +5")<enter>
nnoremap wh :call <SID>issue("seek -5")<enter>
nnoremap ws :call <SID>issue("win-activate")<enter>

nnoremap w1 :call <SID>issue("view tree")<enter>
nnoremap w2 :call <SID>issue("view playlist")<enter>
nnoremap wt :call <SID>issue("win-next")<enter>
