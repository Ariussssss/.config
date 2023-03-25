[[ $TMUX == "" ]] && export TERM="xterm-256color"

export ZSH="/home/arius/.oh-my-zsh"

export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# export EBOOK_PATH=/Applications/calibre.app/Contents/MacOS

# export GOROOT=/usr/local/Cellar/go/1.17.2/libexec
export GOROOT=/usr/local/go 
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on

export LANG=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8

export PATH=$HOME/flutter/bin:$GOBIN:$GOROOT/bin:$GOROOT/bin:$EBOOK_PATH:$PATH


plugins=(git emacs z zsh-autosuggestions git-open)
source $ZSH/oh-my-zsh.sh

alias n="npm run"
alias nv="n dev"
alias ns="n start"
alias nd="n deploy"
alias nb="n build"
alias np="npm publish"
alias ni="npm i"
alias nid="ni -D"
alias nig="ni -g"
alias nd="n deploy"
alias ncns="nc && ns"
alias ncnv="nc && nv"
alias nbnp="nb && np"
alias ys="yarn start"
alias yi="yarn install"
alias yb="yarn build"
alias yv="yarn dev"
alias gclean="git clean -fd"
alias gcob='gcob_now() {git checkout origin/${1} && git checkout -b ${1};}; gcob_now'
# alias es="/usr/bin/emacs $1 &"
# alias e='/usr/bin/emacsclient -c $1'

function es() {
   /usr/bin/emacsclient -c $1 &
}

alias pon="export ALL_PROXY=http://127.0.0.1:7890;"
alias poff="unset ALL_PROXY"
alias ip="curl -i http://ifconfigme/all"
alias cd='cds() {cd ${1} && echo "🐙 Welcome to $(pwd)" && ls;}; cds'
alias ktm='ktm_s() {ps -ef | grep -v grep | grep ${1} | awk "{print $2}" | xargs kill -9;}; ktm_s'
alias ktme="ktm Emacs"
alias ktmc="ktm Chrome"
alias p3="python3"
alias p3m="python3 -m"

# tmux
alias tx="tmux"
alias txls="tx ls"
alias txrs="tx rename-session"
alias txct="tx choose-tree"
alias txcs="tx choose-session"

alias txa="tx attach -t"
alias txs="tx switch -t"
alias txd="tx detach"

alias txks="tx kill-session -t"
alias txksn="tx kill-session" # now
alias txkw="tx kill-window -t"
alias txkwn="tx kill-window" # now
alias txns='txnsn() { tx new -d -s ${1} && txs ${1} && txls;}; txnsn'
alias txrpl='txrpn() { tx resize-pane -t ${1:=0} -y 60;}; txrpn'
alias txrps='txrpn() { tx resize-pane -t ${1:=0} -y 6;}; txrpn'
alias txnss="tx new-session -s"
alias txnw="tx new-window"
alias clickhouse-client="~/lib/ch-test/clickhouse client"
alias hdi='howdoi'

alias ws='word-quest search'
alias wt='word-quest translate'
alias wq='word-quest quest'


alias wl='terminal-to-html'
alias cronlog='cat /home/arius/lib/crontab-test/console | wl'
alias rmcronlog='echo -n '' > /home/arius/lib/crontab-test/console'
# copyLastCmd
alias clc='tmp_clc=$(fc -ln -1 | awk '\''{$1=$1}1'\''); echo $tmp_clc | tr -d '\''\n'\'' | pbcopy'

TITLE=$(pwd)

function hi() {
    keyword=$1
    if [ $keyword ]; then
	history -i | grep $keyword
    else
	history -i -100
    fi
}
spells_location='/home/arius/lib/spells'
spell() {
    shell_name=$1
    if [ $shell_name ]; then
	other_props=($@)
	other_props=${other_props[@]:1}
	echo "\n🦋 Calling: $shell_name\n"
	eval "sh $spells_location/$shell_name.sh $other_props"
    else
	echo "\n🦋 Magic Book \n"
	ls $spells_location | grep -e '\.sh$' | sed 's/\.sh//' | awk '{printf "  - %s\n", $1}'
	echo "\n"
    fi
}

eval "$(starship init zsh)"

# Wasmer
export WASMER_DIR="/home/arius/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
ELECTRON_CUSTOM_DIR="{{ version }}"

EDITOR="/usr/bin/emacsclient"

# init tmux
# cd .
sh ~/.tmux/scripts/index.sh

# emcc
# use emcc
alias ue='source /home/arius/packages/emscripten-core/emsdk/emsdk_env.sh'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PATH="$PATH:$HOME/bin"

# neovim
alias vim="/usr/bin/nvim"
alias v="/usr/bin/nvim"

#
# cpp
cr(){
    if [ "$#" -ne 1 ]; then
        echo "Usage: cr <file.cpp>"
    else
        name=$(echo $1 | cut -f 1 -d '.')
        g++ --std=c++11 $1 -o "$name"; "./$name"
    fi
}

export PATH="/usr/local/opt/bison/bin:$PATH"
# source /usr/local/opt/chruby/share/chruby/chruby.sh

# deno
export DENO_INSTALL="/home/arius/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/binutils/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/binutils/lib"
export CPPFLAGS="-I/usr/local/opt/binutils/include"

# bun completions
[ -s "/home/arius/.bun/_bun" ] && source "/home/arius/.bun/_bun"

# Bun
export BUN_INSTALL="/home/arius/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#Zig
export PATH=$PATH:~/lib/zig

# linux
alias open='wmctrl'

. "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# fnm
export PATH="/home/arius/.local/share/fnm:$PATH"
eval "`fnm env`"

# cuda
# export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# export CUDA_HOME=/usr/local/cuda-11.2/bin

export CUDA_VISIBLE_DEVICES=0,1,2,3
export NVIDIA_VISIBLE_DEVICES=all

export PATH=/home/arius/.nimble/bin:$PATH

export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --preview '~/Tools/Other/fzf-scope.sh {} '"
export FZF_DEFAULT_COMMAND="fd --exclude={.wine,.git,.idea,.vscode,.sass-cache,node_modules,build,.local,.steam,.m2,.rangerdir,.ssh,.ghidra,.mozilla} --type f --hidden --follow"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
