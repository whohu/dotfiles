""""""""""""""""""""""
"" bundle
""""""""""""""""""""""
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

""""""""""""""""""""""
"" plugin
""""""""""""""""""""""
"+++++++++++++++++++
" neobundleの設定
"+++++++++++++++++++
"プラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'whohu/mikucolor.vim'

"+++++++++++++++++++
" neocompleteの設定
"+++++++++++++++++++
"自動起動
let g:neocomplcache_enable_at_startup = 1
"補完が自動で開始される文字数
let g:neocomplcache_auto_completion_start_length = 3
"シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
"大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
"大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
"アンダーバー区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

"+++++++++++++++++++
" neosnippetの設定
"+++++++++++++++++++
"Plugin key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
"For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"+++++++++++++++++++
" vimfilerの設定
"+++++++++++++++++++
"directoryのデフォルトのアクションを変更
autocmd FileType vimfiler call unite#custom_default_action('directory','cd')
"VimFilerでファイルを編集する時はタブで開くようにする
let g:vimfiler_edit_action = 'tabopen'

"+++++++++++++++++++
" uniteの設定
"+++++++++++++++++++
"Uniteのブックマーク機能を使う際にVimfilerを呼び出す
call unite#custom_default_action('source/bookmark/directory' , 'vimfiler')

"+++++++++++++++++++
" syntasticの設定
"+++++++++++++++++++
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

"+++++++++++++++++++
" taglistの設定
"+++++++++++++++++++
"set tags = tags
let Tlist_Ctags_Cmd = "/Applications/MacVim.app/Contents/MacOS/ctags"
"現在表示中のファイルのみのタグしか表示しない
let Tlist_Show_One_File = 1
"taglistのウインドウだけならVimを閉じる
let Tlist_Exit_OnlyWindow = 1

""""""""""""""""""""""
"" Backup
""""""""""""""""""""""
"バックアップを出力する
set backup
"バックアップディレクトリを指定する
set backupdir=/Users/whohu/vimbackup/
"スワップファイルを出力する
set swapfile
"スワップファイルディレクトリを指定する
set directory=/Users/whohu/vimtmp/
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"履歴保存数
set history=1000


""""""""""""""""""""""
"" Encode
""""""""""""""""""""""
"下記の指定は環境によって文字化けする可能性があるので適宜変更する
"文字コードをutf-8にする
set encoding=utf-8

"MacVimでは自動判別が行われるのでfileencodingは無用
"set fileencoding=japan
"set fileencodings=iso-2022-jp,euc-jp,utf-8,ucs2le,ucs-2

set termencoding=utf-8
"メニューに日本語が使われるので内部エンコーディングはcp932
scriptencoding cp932
"ファイルフォーマットをunixの形式にする
set fileformats=unix,dos,mac


""""""""""""""""""""""
"" File
""""""""""""""""""""""
"ファイル変更中でも他のファイルを開けるようにする
set hidden
"ファイル内容が変更されると自動読み込みする
set autoread
"ファイルの行番号を表示
set number
"ステータスラインにファイル名などを表示
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]
""ファイルタイプの検出とファイルの種類に応じたプラグインの選択とインデントファイルの使用を行う
filetype plugin indent on
filetype indent on
"構文強調表示を有効
syntax on


""""""""""""""""""""""
"" Search
""""""""""""""""""""""
"インクリメンタルサーチを行う
set incsearch
"検索結果をハイライトする
set hlsearch
"検索時に文字の大小を区別しない
set ignorecase
"検索時に大文字を含んでいたら大小を区別する
set smartcase
"検索をファイルの先頭へループする
set wrapscan

""""""""""""""""""""""
"" Editor
""""""""""""""""""""""
"自動的にtextwidthで改行しないようにする
set formatoptions=q
"C言語のインデントに従って自動インデントを行う
set cindent
"行頭での<Tab>の幅
set shiftwidth=2
"行頭以外での<Tab>の幅
set tabstop=2
"<Tab>の代わりに<Space>を挿入する
set expandtab
"expandtabで<Tab>が対応する<Space>の数
set softtabstop=2
set backspace=indent,eol,start
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"クリップボードを利用する
set clipboard=unnamed

""""""""""""""""""""""
"" KeyMap
""""""""""""""""""""""
"ノーマルモード中に置換コマンドを入力することができる
nnoremap <D-/> :%s/old/new/gc
"ノーマルモード中にVimFilerを開く
nnoremap <C-Enter> :VimFiler<CR>
"ノーマルモード中にVimShellを開く
nnoremap <D-Enter> :VimShell<CR>
"ノーマルモード中に右タブへ移動することができる
nnoremap <C-tab> :tabn<CR>
"ノーマルモード中に左タブへ移動することができる
nnoremap <C-S-tab> :tabN<CR>
""保存して閉じる、保存せず閉じるのキーマッピングを無効にする
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
command QR QuickRun
