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

# ------------------- Alias -------------------
alias mg="mvn archetype:generate"
if [[ -z $WSL_DISTRO_NAME ]]; then
    proxy_ip="127.0.0.1"
else
    proxy_ip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
fi
alias shttp="export http_proxy=http://${proxy_ip}:1081/; export https_proxy=http://${proxy_ip}:1081/;"
alias uhttp="unset http_proxy; unset https_proxy;"
alias tldr='proxychains tldr'
eval "$(dircolors --sh)"
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh'
alias ssh='TERM=xterm ssh'

# ------------------- fcitx5 for wsl -------------------
# https://github.com/microsoft/wslg/issues/117
if [[ $WSL_DISTRO_NAME && -z $(pgrep -x fcitx5) ]]; then
    fcitx5 --disable=wayland -d &> /dev/null
fi

# ------------------- tmux startup -------------------
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
if command -v tmux &>/dev/null; then
    # if ! [ "$(basename "$(cat "/proc/$PPID/comm")")" = "emacs" ]; then
    if [ "$(basename "$(cat "/proc/$PPID/comm")")" = "alacritty" ]; then
        # if no session is started, start a new session
        test -z ${TMUX} && (tmux attach || tmux new-session -c $PWD)
    fi
fi

# ------------------- zsh fzf keybindings -------------------
# Append this line to ~/.zshrc to enable fzf keybindings for Zsh:
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# ------------------- zsh fzf auto-completion -------------------
# Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# ------------------- zsh Plugins -------------------
source ${ZDOTDIR:-${HOME}}/plugins.zsh
