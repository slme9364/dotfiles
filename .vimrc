set clipboard=autoselect
set clipboard+=unnamed
set clipboard=unnamedplus
set mouse=a
set number
set title
set whichwrap=b,s,h,l,<,>,[,]
set ambiwidth=double
set tabstop=2
set background=dark
syntax on
set expandtab
set shiftwidth=2
set cindent
set laststatus=2
set showcmd
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set cursorline
set cursorcolumn
inoremap {<Enter> {}<Left><CR><ESC><S-o>
    inoremap " ""<LEFT>
    inoremap ' ''<LEFT>
        set notitle
        set nocompatible
        filetype plugin indent off
        set t_Co=256

"----------------------------------------------------------------

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$HOME/.vim/dein')

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" dein でインストールするプラグインは以下のように書く
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoinclude.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('tomasr/molokai')
call dein#add('Shougo/neocomplete.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('Shougo/vimproc')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')
call dein#add('fatih/vim-go')
" リビジョンとかブランチ指定する時はこんな感じに書く
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

call dein#end()

filetype plugin indent on

" インストールしてないプラグインを vim 起動時に自動的にインストールする設定
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
colorscheme molokai
let g:molokai_original=1

"-----------------------------------------
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"----------------------------------------------------------------

let g:quickrun_config={}

let s:config = {
\   "watchdogs_checker/_" : {
\       "hook/copen/enable_exist_data" : 1,
\       "hook/u_nya_/enable" : 1,
\       "hook/inu/enable" : 0,
\       "hook/unite_quickfix/enable" : 0,
\       "hook/echo/enable" : 0,
\       "hook/back_buffer/enable" : 0,
\       "hook/close_unite_quickfix/enable" : 0,
\       "hook/close_buffer/enable_exit" : 0,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/redraw_unite_quickfix/enable_exit" : 0,
\       "hook/close_unite_quickfix/enable_exit" : 1,
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40
\   },
\
\   "cpp/watchdogs_checker" : {
\       "hook/add_include_option/enable" : 1,
\       "type" : "watchdogs_checker/g++",
\   },
\
\   "haskell/watchdogs_checker" : {
\       "type" : "watchdogs_checker/hlint",
\   },
\   "watchdogs_checker/msvc" : {
\       "hook/msvc_compiler/enable" : 1,
\       "hook/msvc_compiler/target" : "c:/program files/microsoft visual studio 10.0",
\       "hook/output_encode/encoding" : "sjis",
\       "cmdopt" : "/Zs ",
\   },
\
\   "watchdogs_checker/g++" : {
\       "cmdopt" : "-std=gnu++0x -Wall",
\   },
\
\   "watchdogs_checker/clang++" : {
\       "cmdopt" : "-std=gnu++0x -Wall",
\   },
\
\   "python/watchdogs_checker" : {
\       "type" : "watchdogs_checker/pyflakes",
\   },
\   
\   "watchdogs_checker/pyflakes" : {
\       "command" : "c:/python27/scripts/pyflakes",
\   },
\}

let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1


call extend(g:quickrun_config, s:config)
unlet s:config

" watchdogs.vim の設定を追加
call watchdogs#setup(g:quickrun_config)

"-------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

