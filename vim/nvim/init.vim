"clipboard setting
"set clipboard=autoselect
set clipboard+=unnamed
set clipboard=unnamedplus

"mouse can use
set mouse=a

"print number
set number

"set title
set title

set whichwrap=b,s,h,l,<,>,[,]
set ambiwidth=double

"tab equals two space
set tabstop=2


"background color
set background=dark

"tab key -> space key
set expandtab

"if autoindent on, indent two space
set shiftwidth=2

"autoindent
set cindent

"print status line at second line
set laststatus=2

"show command
set showcmd

"print tab, trail, eol, etc...
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"remove octal and only hex
set nrformats-=octal

"if open unsaved file, another file can open
set hidden

"history limit
set history=50

"if visual mode, not exist range can select
set virtualedit=block

"can move between the lines
set whichwrap=b,s,[,],<,>

"backspace can always use in vim
set backspace=indent,eol,start

"when vim open file, file name conpletion
set wildmenu

"stand out cursor
set cursorline
set cursorcolumn

"inoremap settings
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap <silent> jj <ESC>

"nnoremap"
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k

"if title prtint 'Thanks for flying vim', notitle remove this message
"set notitle

"can use 256 color
set t_Co=256

let g:python3_host_prog = expand('/usr/bin/python3')

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

let s:cache_home = expand('~/.cache')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

colorscheme molokai

"syntax
syntax on

filetype plugin indent on

