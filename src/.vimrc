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
