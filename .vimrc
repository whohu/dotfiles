""""""""""""""""""""""""""""""""""""""""""""
"" Plugin neobundle
""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'whohu/mikucolor.vim'
""""""""""""""""""""""""""""""""""""""""""""
"" Plugin neocomplcache
""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
""""""""""""""""""""""""""""""""""""""""""""
"" Plugin neosnippet
""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""
"" Plugin syntastic
""""""""""""""""""""""""""""""""""""""""""""
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
"active_filetypesに有効化するファイル拡張子を指定
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['php','javascript'],
      \ 'passive_filetypes': [] }
let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw#%w}]'
""""""""""""""""""""""""""""""""""""""""""""
"" Plugin taglist
""""""""""""""""""""""""""""""""""""""""""""
"MacVim以外のVimを使用するときはパスを適宜変更
let Tlist_Ctags_Cmd = "/Applications/MacVim.app/Contents/MacOS/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
""""""""""""""""""""""""""""""""""""""""""""
"" Backup
""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
set browsedir=buffer
set history=1000
""""""""""""""""""""""""""""""""""""""""""""
"" Encode
""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
"メニューが日本語なのでcp932で対応
scriptencoding cp932
set fileformats=unix,dos,mac
"MacVimでは自動判別が行われるのでfileencodingは使わない
"set fileencoding=japan
"set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs2le,ucs-2
""""""""""""""""""""""""""""""""""""""""""""
"" File
""""""""""""""""""""""""""""""""""""""""""""
"ファイル変更中でも他のファイルを開ける
set hidden
"ファイル内容が変更されると自動読み込み
set autoread
"ファイルの行番号を表示
set number
"ステータスラインのカスタマイズ
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
"ファイルタイプの検出/ファイルの種類に応じたプラグインの選択/インデントファイルの使用
filetype plugin indent on
filetype indent on
""""""""""""""""""""""""""""""""""""""""""""
"" Search
""""""""""""""""""""""""""""""""""""""""""""
"入力中に検索処理を開始
set incsearch
"検索結果をハイライト
set hlsearch
"検索時に文字の大小を区別しない
set ignorecase
"検索時に大文字を含んでいたら大小を区別する
set smartcase
"検索をファイルの先頭へループ
set wrapscan
""""""""""""""""""""""""""""""""""""""""""""
"" Editor
""""""""""""""""""""""""""""""""""""""""""""
"textwidthによる自動改行無効
set formatoptions=q
"自動インデント
set cindent
"行頭での<Tab>の幅
set shiftwidth=2
"行頭以外での<Tab>の幅
set tabstop=2
"<Tab>の代わりに<Space>を挿入
set expandtab
"expandtabで<Tab>が対応する<Space>の数
set softtabstop=2
"バックスペースでカーソルの直前の文字を消す
set backspace=indent,eol,start
"カーソルが行頭/行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"クリップボードを利用
set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""""
"" Key Mapping
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <D-/> :%s/old/new/gc
nnoremap <C-tab> :tabn<CR>
nnoremap <C-S-tab> :tabN<CR>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
"括弧自動補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
