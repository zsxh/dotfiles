# echo "interactive shell"
# zmodload zsh/zprof # zprof profile

bindkey -e # emacs keybindings

# lang
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

# ------------------- PATH -------------------
source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"

# Lazy load jenv
if type jenv > /dev/null; then
    export PATH="${JENV_ROOT}/shims:${PATH}"
    function jenv() {
        unset -f jenv
        eval "$(command jenv init -)"
        jenv $@
    }
fi

# Lazy load pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    export PATH="${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init - --no-rehash)"
        pyenv $@
    }
fi

# Node Version Manager, # https://github.com/Schniz/fnm/issues/171#issuecomment-721696818
eval "$(fnm env)"

# ------------------- Alias -------------------
alias mg="mvn archetype:generate"
alias shttp="export http_proxy=http://127.0.0.1:1081/; export https_proxy=http://127.0.0.1:1081/;"
alias uhttp="unset http_proxy; unset https_proxy;"
alias tldr='proxychains tldr'
eval "$(dircolors --sh)"
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias ssh='TERM=xterm ssh'

# ------------------- tmux startup -------------------
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if command -v tmux &>/dev/null; then
    # if ! [ "$(basename "$(cat "/proc/$PPID/comm")")" = "emacs" ]; then
    if [ "$(basename "$(cat "/proc/$PPID/comm")")" = "alacritty" ]; then
        # if no session is started, start a new session
        test -z ${TMUX} && (tmux attach || tmux new-session -c $PWD)
    fi
fi

# ------------------- Zsh Plugins -------------------
source ${ZDOTDIR:-${HOME}}/plugins.zsh
