# echo "interactive shell"
# zmodload zsh/zprof # zprof profile

bindkey -e # emacs keybindings

# lang
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

# Output commands to set the LS_COLORS environment variable.
if [[ ${OS_UNAME} == "Linux" ]] && command -v dircolors &>/dev/null; then
    eval "$(dircolors --sh)"
elif [[ ${OS_UNAME} == "Darwin" ]] && command -v gdircolors &>/dev/null; then
    eval "$(gdircolors --sh)"
fi

# ------------------- PATH -------------------
source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"

# load rtx
if command -v rtx &>/dev/null; then
    export PATH="$HOME/.local/share/rtx/shims:${PATH}"
    eval "$(rtx activate zsh)"
fi

# ------------------- Alias -------------------
alias mg="mvn archetype:generate"
# before wsl verion 2.0.0
# if [[ -z $WSL_DISTRO_NAME ]]; then
#     proxy_ip="127.0.0.1"
# else
#     proxy_ip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
# fi
proxy_ip="127.0.0.1"
alias shttp="export http_proxy=http://${proxy_ip}:1080/; export https_proxy=http://${proxy_ip}:1080/;"
alias uhttp="unset http_proxy; unset https_proxy;"
# proxychains-ng will not work in macos unless disabling sip
# alias tldr='proxychains tldr'
if [[ ${OS_UNAME} == "Linux" ]]; then
    alias ls='ls --color=auto --group-directories-first'
elif [[ ${OS_UNAME} == "Darwin" ]] && command -v gls &>/dev/null; then
    alias ls='gls --color=auto --group-directories-first'
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias ssh='TERM=xterm ssh'

# ------------------- fcitx5 for wsl -------------------
# https://github.com/microsoft/wslg/issues/117
if [[ $WSL_DISTRO_NAME && -z $(pgrep -x fcitx5) ]]; then
    fcitx5 --disable=wayland -d &> /dev/null
fi

# ------------------- OrbStack for MacOS -------------------
# Added by OrbStack: command-line tools and integration
[ -f ~/.orbstack/shell/init.zsh ] && source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# ------------------- tmux startup -------------------
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
# if command -v tmux &>/dev/null; then
#     if [ "$(basename "$(cat "/proc/$PPID/comm")")" = "alacritty" ]; then
#         # if no session is started, start a new session
#         test -z ${TMUX} && (tmux attach || tmux new-session -c $PWD)
#     fi
# fi

# ------------------- zsh fzf keybindings -------------------
# Append this line to ~/.zshrc to enable fzf keybindings for Zsh:
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# ------------------- zsh fzf auto-completion -------------------
# Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# ------------------- zsh Plugins -------------------
source ${ZDOTDIR:-${HOME}}/plugins.zsh
