# echo "interactive shell"
# zmodload zsh/zprof # zprof profile

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

# ------------------- Zsh Plugins -------------------
source ${ZDOTDIR:-${HOME}}/plugins.zsh
