#XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

export HISTFILE=$ZDOTDIR/.zhistory      # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# editor
export EDITOR='vim'
export VISUAL='vim'

# lang
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# TLDR settings
export TLDR_CACHE_ENABLED=1
export TLDR_CACHE_MAX_AGE=720 # hours

# ls -l 用长时间代替短时间格式
export TIME_STYLE=long-iso

# https://stackoverflow.com/questions/28491458/zsh-agnoster-theme-showing-machine-name
# hiding user@hostname for agnoster.zsh-theme
# DEFAULT_USER="$(whoami)"

# 触摸板双指水平滑动
# gsettings list-keys com.deepin.dde.touchpad
# eval "$(gsettings set com.deepin.dde.touchpad horiz-scroll-enabled true)"
