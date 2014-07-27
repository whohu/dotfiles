######################################
## History
#######################################
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

#######################################
## AutoComplete
#######################################
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

#######################################
# Prompt
#######################################
# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info
precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f %3F%~%f%1v\n%# '

#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#######################################
# Alias
#######################################
#ctagsはMacVimに同梱されているctagsを使用する
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
#MacVimのタブで開く
alias mvim="mvim --remote-tab-silent"
alias his='history'
alias g='git'
alias gb='git branch'
alias gbd='git branch -D'
alias gf='git fetch'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gs='git status'
alias gl='git log'
alias gg='git grep'
alias gd='git diff'
alias vu='vagrant up'
alias vup='vagrant up --provision'
alias vp='vagrant provision'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vbr='VAGRANT_BRIDGE=Wi-Fi vagrant reload && vagrant provision'
alias rm='rm -i'

#######################################
# tmux
#######################################
#tmux自動起動
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

#######################################
# UseEditor
#######################################
export SVN_EDITOR=vim
export GIT_EDITORA=vim
