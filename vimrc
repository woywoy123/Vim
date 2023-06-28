 set nocompatible              " be iMproved, required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" GruvBox Theme 
Plug 'gruvbox-community/gruvbox'

" Spell check library
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-SpellCheck' 

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" A git wrapper.
Plug 'tpope/vim-fugitive'

" Linters for python
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
 
" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'

Plug 'bling/vim-airline'                  " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'Lokaltog/powerline'                 " Powerline fonts plugin

" Automatically show Vim's complete menu while typing.
" Plug 'vim-scripts/AutoComplPop'

" Languages and file types
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'

" Discord 
Plug 'Stoozy/vimcord'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'}
Plug 'vim-test/vim-test'

" Autocomplete plugin - Base Plugin
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'

" Autocomplete additional language supports
" Plug 'keremc/asyncomplete-clang.vim'

call plug#end()

" Set Behaviour 
set expandtab
set shiftwidth=4
set softtabstop=4

" set autoindent
set cindent 
set ttyfast
set autoread
set clipboard=unnamedplus,unnamed
" set completeopt=menu,longest
set hlsearch "highlight search 
set number "Numbered lines
set encoding=utf-8
set mouse=a
" set linebreak
set showmatch
set ruler
set noea " stops window adjustment when using vsplit/hsplit 
syntax on

" ------------------ Autocomplete ------------------ 
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" 
" Allows one to create new line regardless if pop-up window is there 
" inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
" 
" C installer 
" autocmd User asyncomplete_setup call asyncomplete#register_source(
"     \ asyncomplete#sources#clang#get_source_options())

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

" ------------------ Powerline Settings -------------- 
let g:Powerline_symbols = 'fancy'

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
        colorscheme PaperColor              " set color scheme
    endif
endif
" ------------------------------------------------------------------ 


"=====================================================
" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline_powerline_fonts=1

" ----------------- Spelling ------------------
" Enable spelling 
" set complete+=kspell
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
" autocmd VimResized * wincmd =

" ----------------- Linters ------------------- 
let python_highlight_all=1
" --------------------------------------------- 

" -------------- Markdown Preview Config ---------------
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'

nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle


" -------------- Custom CMUS functions -----------------
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
