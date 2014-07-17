set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'msanders/snipmate.vim'
" Bundle 'scrooloose/syntastic.git'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "tomtom/tlib_vim"
Bundle 'Rykka/riv.vim'
Bundle 'alfredodeza/khuno.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'jamessan/vim-gnupg'
Bundle 'sjl/gundo.vim'
" Bundle 'sontek/minibufexpl.vim'
Bundle 'sontek/rope-vim'
Bundle 'mrtazz/simplenote.vim'
Bundle 'joonty/vdebug.git'

source ~/.vim/simplenoterc

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    setlocal textwidth=79
    set virtualedit=all
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
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    setlocal textwidth=0
    set virtualedit=
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
  endif
endfunction

filetype on
filetype plugin indent on
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
set mouse=a
set expandtab tabstop=4 shiftwidth=4 
set autoindent
set wildmode=list:longest
set hidden
set laststatus=2
set statusline=%F%m%r%h%w\ \ \ \ %=%02l,%02v\ of\ %L\ [%p%%]
" set textwidth=79
set t_Co=256
set background=dark
colorscheme solarized
highlight Normal ctermbg=none
highlight PyFlakes ctermbg=124

let g:vdebug_options= {
\    "port" : 9003,
\    "server" : 'localhost',
\    "timeout" : 20,
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
