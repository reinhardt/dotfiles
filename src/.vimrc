set nocompatible               " be iMproved
filetype off                   " required!

if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif

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
Plugin 'python-mode/python-mode'
Plugin 'vim-airline/vim-airline'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kana/vim-metarw'
Plugin 'kana/vim-metarw-git'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/vim-metarw-simplenote'
Plugin 'blueyed/vim-diminactive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'LnL7/vim-nix'
Plugin 'tpope/vim-abolish'
if exists('g:use_black')
    Plugin 'psf/black'
endif
" Plugin 'paulkass/jira-vim'
if exists('g:use_octodon')
    Plugin 'file://~/projects/hamster/octodon'
endif

"let g:black_virtualenv = '/home/reinhardt/.local/pipx/venvs/black'

let g:octodon_virtualenv = '~/.local/share/nvim/octodon'
python3 << endpython3
sys.path.insert(0, "/home/reinhardt/projects/hamster/octodon/src")
endpython3
noremap <Leader>oc :OctodonClock<CR>
noremap <Leader>os :OctodonTimeSum<CR>

call vundle#end()

call metarw#define_wrapper_commands(0)

source ~/.vim/simplenoterc
source ~/.vim/jiravimrc
" command! Daily SimplenoteOpen f704b70fc4ed65c4e19088821954f6ff
" command! Daily edit sn:f704b70fc4ed65c4e19088821954f6ff
command! Daily edit ~/Notes/Daily.md
command! Music edit sn:625a73545154fb1cc48db8bd34dfc9f1

let s:email = 'askesemann@googlemail.com'

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! SetWrap(value)
  if a:value == "soft"
    setlocal wrap linebreak
    setlocal textwidth=0
    setlocal display+=lastline
    setlocal formatoptions-=a
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
    if a:value == "hard"
      setlocal formatoptions+=a
      setlocal textwidth=88
    else
      setlocal formatoptions-=a
      setlocal textwidth=0
    endif
    setlocal nowrap nolinebreak
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
  if &wrap  " soft wrap is on
    echo "Wrap HARD"
    call SetWrap("hard")
  else
    if &formatoptions =~ "a"  " hard wrap is on
      echo "Wrap OFF"
      call SetWrap("off")
    else  " wrap is off
      echo "Wrap SOFT"
      call SetWrap("soft")
    endif
  endif
endfunction

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

noremap <Leader>b :let @+="b " . expand("%:p") . ":" . line(".")<CR>

cnoremap <ESC><BS> <C-W>

tnoremap <C-w> <C-\><C-n>

function! ZPretty(type)
    let save_pos = getpos(".")
    if a:type == 'pt'
        let l:params = ''
    else
        let l:params = ' --' . a:type
    endif
    execute ':silent %!zpretty' . l:params
    call setpos('.', save_pos)
endfunction

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
set textwidth=0
set nowrap
set nolinebreak
set nojoinspaces
set t_Co=256
set complete-=i
set path=.,,parts/omelette/**,parts/packages/**,src/**,dev/**,lib/**,/usr/include
set splitright
set splitbelow
set cursorline
set nocursorcolumn

"set termguicolors
colorscheme solarized8_high
set background=light
"if readfile("/home/reinhardt/.is_sunny")[0] == 1
"" for sunny conditions
"  set background=light
"  hi! ColorColumn term=reverse ctermbg=243 guibg=#eee8d5
"else
"  set background=dark
"  hi! SpellBad cterm=underline ctermbg=235
"endif
"highlight Normal ctermbg=none  " does not work reliably, modify colorscheme instead
"highlight Visual ctermbg=240
"highlight PyFlakes ctermbg=124

filetype on
filetype plugin indent on

let g:autoformat = 1
function SetAutoFormat(value)
    if a:value
        autocmd BufWritePre *.py execute ':Black'
        autocmd BufWritePre *.pt call ZPretty('pt')
        autocmd BufWritePre *.zcml call ZPretty('zcml')
        autocmd BufWritePre *.xml call ZPretty('xml')
        let g:autoformat = 1
    else
        autocmd! BufWritePre *.py
        autocmd! BufWritePre *.pt
        autocmd! BufWritePre *.zcml
        autocmd! BufWritePre *.xml
        let g:autoformat = 0
    endif
endfunction
call SetAutoFormat(1)

noremap <silent> <Leader>f :call ToggleAutoFormat()<CR>
function! ToggleAutoFormat()
    if g:autoformat
        echo "Autoformat off"
        call SetAutoFormat(0)
    else
        echo "Autoformat on"
        call SetAutoFormat(1)
    endif
endfunction

autocmd TermOpen * setlocal numberwidth=7
autocmd BufWritePost /home/reinhardt/Notes/*.md,/home/reinhardt/projects/notes/_notes/*.md call jobstart('/home/reinhardt/projects/notes/notes.sh', {'detach': 1})
autocmd BufWritePost *.md call jobstart('pandoc --standalone --from markdown_strict --to html --metadata title=Preview --output /tmp/' . expand('%:t') . '-preview.html < ' . expand('%'))
autocmd BufWritePost mutt-* call jobstart('mutt-multipart-filter > /tmp/' . expand('%:t') . '-preview.html < ' . expand('%'))
autocmd BufRead,BufNewFile *.zcml setfiletype xml

noremap <silent> <Leader>p :!qutebrowser file:///tmp/%:t-preview.html<CR>


"if has("nvim-0.4.2")
"    autocmd TermEnter * setlocal nonumber
"    autocmd TermLeave * setlocal number
"endif

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
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_lookup_project = 1
let g:pymode_rope = 1
let g:pymode_trim_whitespaces = 0
let g:pymode_options_max_line_length = 88
let g:pymode_breakpoint_bind = ""
if has('nvim')
    let g:pymode_python = 'python3'
endif

let g:netrw_localrmdir='rm -r'
let g:netrw_keepdir=0
let g:netrw_localcopycmdopt=" -R"
let g:netrw_liststyle=1
let g:netrw_banner=0

noremap - :Explore<CR>

if has("gui_running")
"    set guifont=Monospace\ 12
    cmap <C-V>		<C-R>+
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
endif
