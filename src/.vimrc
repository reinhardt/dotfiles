set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" Plugin 'kevinw/pyflakes-vim'
" Plugin 'msanders/snipmate.vim'
" Plugin 'scrooloose/syntastic.git'
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependency of vim-snipmate
Plugin 'tomtom/tlib_vim'  " dependency of vim-snipmate
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Rykka/riv.vim'
" Plugin 'alfredodeza/khuno.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lifepillar/vim-solarized8'
Plugin 'limadm/vim-blues'
Plugin 'ervandew/supertab'
Plugin 'jamessan/vim-gnupg'
Plugin 'sjl/gundo.vim'
" Plugin 'sontek/minibufexpl.vim'
" Plugin 'sontek/rope-vim'
Plugin 'mrtazz/simplenote.vim'
" Plugin 'joonty/vdebug.git'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kana/vim-metarw'
Plugin 'kana/vim-metarw-git'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/vim-metarw-simplenote'
Plugin 'blueyed/vim-diminactive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()

call metarw#define_wrapper_commands(0)

source ~/.vim/simplenoterc
" command! Daily SimplenoteOpen f704b70fc4ed65c4e19088821954f6ff
" command! Daily edit sn:f704b70fc4ed65c4e19088821954f6ff
command! Daily edit ~/Notes/Daily.md
command! Music edit sn:625a73545154fb1cc48db8bd34dfc9f1

let s:email = 'askesemann@googlemail.com'

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! SetWrap(value)
  if a:value
    setlocal wrap linebreak nolist
    setlocal textwidth=0
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  else
    setlocal nowrap
    setlocal textwidth=79
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! nunmap <buffer> j
    silent! nunmap <buffer> k
    silent! nunmap <buffer> 0
    silent! nunmap <buffer> $
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  endif
endfunction

function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call SetWrap(0)
  else
    echo "Wrap ON"
    call SetWrap(1)
  endif
endfunction

call SetWrap(1)

noremap <silent> <Leader>s :call ToggleSpell()<CR>
function! ToggleSpell()
  if &spell
    if &spelllang == "en"
      echo "Spell DE"
      setlocal spelllang=de
    else
      echo "Spell OFF"
      setlocal nospell
    endif
  else
    echo "Spell EN"
    setlocal spell
    setlocal spelllang=en
  endif
endfunction

cnoremap <ESC><BS> <C-W>

let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
set mouse=a
set expandtab tabstop=4 shiftwidth=4 
set autoindent
set wildmode=list:longest
set hidden
set laststatus=2
"set statusline=%F%m%r%h%w\ \ \ \ %=%02l,%02v\ of\ %L\ [%p%%]
set backspace=indent,eol,start
set number
set nospell
set spelllang=en
" set textwidth=79
set t_Co=256
set complete-=i
set path=.,,parts/omelette/**,parts/packages/**,src/**,lib/**,/usr/include

set termguicolors
colorscheme solarized8_high
if readfile("/home/reinhardt/.is_sunny")[0] == 1
" for sunny conditions
  set background=light
  hi! ColorColumn term=reverse ctermbg=243 guibg=#eee8d5
else
  set background=dark
  hi! SpellBad cterm=underline ctermbg=235
endif
highlight Normal ctermbg=none
highlight Visual ctermbg=240
highlight PyFlakes ctermbg=124

filetype on
filetype plugin indent on

let g:diminactive_use_syntax = 0
let g:diminactive_use_colorcolumn = 1

let g:vdebug_options= {
\    "port" : 9003,
\    "server" : 'localhost',
\    "timeout" : 60,
\    "on_close" : 'detach',
\    "break_on_open" : 1,
\    "ide_key" : '',
\    "path_maps" : {},
\    "debug_window_level" : 0,
\    "debug_file_level" : 0,
\    "debug_file" : "",
\    "watch_window_style" : 'expanded',
\    "marker_default" : '⬦',
\    "marker_closed_tree" : '▸',
\    "marker_open_tree" : '▾'
\}
let g:vdebug_keymap = {
\    "run" : "c",
\    "run_to_cursor" : "<F1>",
\    "step_over" : "n",
\    "step_into" : "s",
\    "step_out" : "r",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<C-F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

let g:pymode_folding = 0
let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0
let g:pymode_trim_whitespaces = 0
if has('nvim')
    let g:pymode_python = 'python3'
endif

let g:netrw_localrmdir='rm -r'
let g:netrw_keepdir=0

if has("gui_running")
"    set guifont=Monospace\ 12
    cmap <C-V>		<C-R>+
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
endif
