set langmenu=ja_jp.utf-8
if has('gui_macvim')
    set transparency=6
    set guifont=Menlo:h12
    set lines=90 columns=200
    set guioptions-=T
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif
colorscheme mikucolor
