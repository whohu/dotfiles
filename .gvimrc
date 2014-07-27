set langmenu=ja_jp.utf-8

"" -------------------
"" Display
"" -------------------
"MacVimのデフォルトのウィンドウサイズを変える
if has('gui_macvim')
    set transparency=6
    set guifont=Menlo:h12
    set lines=90 columns=200
    set guioptions-=T
endif

colorscheme mikucolor

"シンタックスカラーリングを設定する
syntax on
"行番号を表示する
set number
"編集中のファイル名を表示する
set title
"入力中のコマンドを表示する
set showcmd
"座標を表示する
set ruler
"閉じ括弧の入力時に対応する括弧を表示する
set showmatch
"showmatchの表示時間
set matchtime=3
"ステータスラインを常に表示する
set laststatus=2
"空白文字を表示
set list
"入力モード切り替え時に自動的に英語入力に切り替える機能をオフにする
set noimdisableactivate
"タブ、行末等の不可視文字を表示する
set listchars=tab:>\ ,eol:~
"これ入れないと下記が反映されない
scriptencoding utf-8
"全角スペースと行末の半角スペースを赤色にする
augroup highlightSpace
    autocmd!
    autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red guibg=Red
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　\|\s\+$/
augroup END
