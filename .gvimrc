set langmenu=ja_jp.utf-8

""""""""""""""""""""
" Display
""""""""""""""""""""
"MacVimのデフォルトのウィンドウサイズを変える
if has('gui_macvim')
    set transparency=6
    set guifont=Menlo:h12
    set lines=90 columns=200
    set guioptions-=T
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

colorscheme mikucolor

"シンタックスカラーリングを設定
syntax on
"行番号を表示
set number
"編集中のファイル名を表示
set title
"入力中のコマンドを表示
set showcmd
"座標を表示
set ruler
"閉じ括弧の入力時に対応する括弧を表示
set showmatch
"showmatchの表示時間
set matchtime=3
"ステータスラインを常に表示
set laststatus=2
"空白文字を表示
set list
"タブ，行末等の不可視文字を表示
set listchars=tab:>\ ,eol:~
"全角スペースと行末の半角スペースを赤色へ
scriptencoding utf-8
augroup highlightSpace
    autocmd!
    autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red guibg=Red
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　\|\s\+$/
augroup END
