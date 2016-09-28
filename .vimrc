""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin neobundle
""""""""""""""""""""""""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'whohu/mikucolor.vim'

call neobundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin neosnippet
""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['php','javascript'],
      \ 'passive_filetypes': [] }
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw#%w}]'
""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
set browsedir=buffer
set history=1000
""""""""""""""""""""""""""""""""""""""""""""""""""
" Encode
""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
scriptencoding cp932
set fileformats=unix,dos,mac
set fileencoding=japan
set fileencodings=iso-2022-jp-3,iso-2022-jp,euc-jisx0213,euc-jp,utf-8,ucs-bom,eucjp-ms,cp932,ucs2le,ucs-2
""""""""""""""""""""""""""""""""""""""""""""""""""
" File
""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set autoread
set number
set showcmd
set title
set ruler
set matchtime=3
set showmatch
set laststatus=2
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
set list
set listchars=tab:>\ ,eol:~
scriptencoding utf-8
augroup highlightSpace
    autocmd!
    autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red guibg=Red
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　\|\s\+$/
augroup END
filetype plugin indent on
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions=q
set cindent
set shiftwidth=2
set tabstop=2
"set expandtab
set softtabstop=2
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-tab> :tabn<CR>
nnoremap <C-S-tab> :tabN<CR>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
" 対応括弧の自動入力
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" Ctrl-pでレジスタに格納せず連続貼り付け
vnoremap <silent> <C-p> "0p<CR>
