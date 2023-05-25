#XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

export HISTFILE=$ZDOTDIR/.zhistory      # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# editor
export EDITOR='vim'
export VISUAL='vim'

# term
export TERM=xterm

# lang
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

# input method
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# TLDR settings
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720 # hours

# ls -l 用长时间代替短时间格式
export TIME_STYLE=long-iso
