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
Plugin 'davidhalter/jedi-vim'
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'preservim/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kana/vim-metarw'
Plugin 'kana/vim-metarw-git'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/vim-metarw-simplenote'
Plugin 'blueyed/vim-diminactive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'shumphrey/fugitive-gitlab.vim'
Plugin 'tpope/vim-rhubarb'
Plugin 'LnL7/vim-nix'
Plugin 'tpope/vim-abolish'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
if exists('g:use_black')
    Plugin 'psf/black'
    Plugin 'brentyi/isort.vim'
endif
" Plugin 'paulkass/jira-vim'
if exists('g:use_octodon')
    Plugin 'reinhardt/octodon'
endif

let g:python3_host_prog = '/home/reinhardt/.local/share/nvim/python/bin/python'
let mapleader = ","

"let g:black_virtualenv = '/home/reinhardt/.local/pipx/venvs/black'

let g:octodon_virtualenv = '~/.local/share/nvim/octodon'
python3 << endpython3
sys.path.insert(0, "/home/reinhardt/projects/hamster/octodon/src")
endpython3
noremap <Leader>o :OctodonClock<CR>
" noremap <Leader>os :OctodonTimeSum<CR>

noremap <Leader>g :vert Git<CR>
noremap <Leader>h :s~https://github.com/\([^/]*\)/\([^/]*\)/issues/\([0-9]*\)~\1/\2#\3~<CR>
noremap <Leader>H :s~\([^/ ]*\)/\([^/]*\)#\([0-9]*\)~https://github.com/\1/\2/issues/\3~<CR>

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

noremap <Leader>n :let @+=expand("%:p")<CR>
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
"set splitright
"set splitbelow
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

let g:autoblack = 1
function SetAutoBlack(value)
    if a:value
        autocmd BufWritePre *.py call isort#Isort(0, line('$'), v:null, v:false)
        autocmd BufWritePre *.py execute ':Black'
        let g:autoblack = 1
    else
        autocmd! BufWritePre *.py
        let g:autoblack = 0
    endif
endfunction
call SetAutoBlack(1)

let g:autozpretty = 1
function SetAutoZPretty(value)
    if a:value
        autocmd BufWritePre *.pt call ZPretty('pt')
        autocmd BufWritePre *.zcml call ZPretty('zcml')
        autocmd BufWritePre *.xml call ZPretty('xml')
        let g:autozpretty = 1
    else
        autocmd! BufWritePre *.pt
        autocmd! BufWritePre *.zcml
        autocmd! BufWritePre *.xml
        let g:autozpretty = 0
    endif
endfunction
call SetAutoZPretty(1)

function! ToggleAutoBlack()
    if g:autoblack
        echo "Auto Black off"
        call SetAutoBlack(0)
    else
        echo "Auto Black on"
        call SetAutoBlack(1)
    endif
endfunction
function! ToggleAutoZPretty()
    if g:autozpretty
        echo "Auto ZPretty off"
        call SetAutoZPretty(0)
    else
        echo "Auto ZPretty on"
        call SetAutoZPretty(1)
    endif
endfunction

noremap <silent> <Leader>f :call ToggleAutoBlack()<CR>
noremap <silent> <Leader>z :call ToggleAutoZPretty()<CR>

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

" python3 << endpython3
" sys.path.insert(0, "/home/reinhardt/.local/pipx/venvs/pylint/lib/python3.8/site-packages/")
" endpython3

let g:pymode_virtualenv_path = '/home/reinhardt/.local/share/nvim/python'
let g:pymode_debug = 0
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'mccabe']
let g:pymode_lint_options_pylint = {'max_line_length': 88, 'load-plugins': 'perflint', 'disable': ['imports', 'invalid-name', 'no-member', 'no-self-use', 'missing-module-docstring', 'empty-function-docstring', 'loop-global-usage'], 'clear_cache': 1}
let g:pymode_lint_cwindow = 0
let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope_completion = 0
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

let g:gutentags_project_root=['buildout.cfg']
let g:gutentags_add_default_project_roots=0

noremap <Leader>t :TagbarToggle<CR>

set foldlevel=10

let g:isort_vim_options = '--profile=black --force-alphabetical-sort --force-single-line --lines-after-imports=2'

let g:netrw_localrmdir='rm -r'
let g:netrw_keepdir=0
let g:netrw_localcopycmdopt=" -R"
let g:netrw_liststyle=0
let g:netrw_banner=0

noremap - :Explore<CR>

let g:airline_section_y=''
let g:airline_section_z='%3p%% %#__accent_bold#%{g:airline_symbols.maxlinenr}%#__restore__# :%3v'
let g:airline_solarized_bg='dark'
let g:airline_theme='bubblegum'
let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
if g:airline_theme == 'solarized'
    for colors in values(a:palette.inactive)
    let colors[2] = 245
    let colors[3] = 254
    endfor
endif
endfunction


" Add --follow to Rg command
command! -bang -nargs=* Rg call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case --follow -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rgg call fzf#vim#grep(
            \ "rg --column --line-number --no-heading --color=always --smart-case --follow --no-ignore-vcs -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
noremap <Leader>. :Files<CR>

let g:snipMate = get(g:, 'snipMate', {})
let g:snipMate['snippet_version'] = 1

let g:fugitive_gitlab_domains = ['https://git.syslab.com']

if has("gui_running")
"    set guifont=Monospace\ 12
    cmap <C-V>		<C-R>+
    exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
endif
