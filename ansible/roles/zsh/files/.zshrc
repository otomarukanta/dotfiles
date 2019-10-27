#
# 基本設定
#
bindkey -e # キーバインドのemacsモードに設定

setopt no_beep # ビープ音を鳴らさない
setopt correct #  のスペルを訂正
setopt magic_equal_subst # =以降も補間 --prefix=/usrなど

#
# 補完設定
#
fpath=($HOME/.zsh/completions/src $fpath)
autoload -U compinit; compinit # 補完機能を有効
setopt auto_list # 補完候補を一覧で表示
setopt auto_menu # 補完キー
setopt auto_pushd # 移動したディレクトリを保存
setopt pushd_ignore_dups # pushd重複排除
setopt list_packed # 補完対象の表示をつめる
setopt no_list_beep # 補完時のビープ音を鳴らさない

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:default' list-colors ${LS_COLORS}
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

#
# コマンド履歴
#
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt share_history # 複数起動しているzshの間で履歴を共有
setopt hist_ignore_all_dups # 同じコマンドは履歴に追加しない
setopt hist_ignore_space # スペースから始まるコマンドは履歴に追加しない
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'  # 単語の一部としし認識される文字のセット

#
# 表示回り設定
#
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export TERM=xterm-256color

autoload colors; colors # プロンプトに色をつける
autoload -Uz vcs_info
setopt prompt_subst # プロンプト定義内で変数置換やコマンド置換を扱う

# git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

local prompt_date="%{${bg[cyan]}${fg[black]}%}[%*]%{${reset_color}%}"
local prompt_host=" %{${fg[magenta]}%}%n@%M"
local prompt_dir="%{${reset_color}${fg[yellow]}%} [%d]%{${reset_color}%}"
PROMPT="${prompt_date}${prompt_host}${prompt_dir}
 %(?.%{${fg[green]}%}.%{${fg[red]}%})"'$'"%{${reset_color}%} "
PROMPT2=" > "
RPROMPT='${vcs_info_msg_0_}'

#
# PATH
#
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/local/go/bin:$PATH" # golang
export PATH="$HOME/local/nvim-linux64/bin:$PATH" # neovim

#
# alias
#
case "${OSTYPE}" in
    darwin*)
        alias ls="ls -GF"
        ;;
    linux*)
        alias ls="ls -F --color"
        ;;
esac
alias la="ls -a"
alias ll="ls -l"

ghcd() {
    dir=$(ghq list -p | fzf --height 30% --reverse --border)
    cd $dir
}

export LANG=ja_JP.UTF-8

#source $HOME/.zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
#source $HOME/.zsh/peco.zsh

source $HOME/local/zplugin-master/zplugin.zsh

source $HOME/local/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh