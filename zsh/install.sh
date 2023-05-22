#!/bin/bash

set -e

#XDG
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${XDG_CONFIG_HOME}/local/share
export XDG_CACHE_HOME=${XDG_CONFIG_HOME}/cache
# zsh
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

mkdir -p ${ZDOTDIR}

currentDir=$(
  cd $(dirname "$0")
  pwd)

echo ${currentDir}

ln -sf ${currentDir}/.zshenv ~/.zshenv
ln -sf ${currentDir}/.zprofile ${ZDOTDIR}/.zprofile
ln -sf ${currentDir}/.zshrc ${ZDOTDIR}/.zshrc
ln -sf ${currentDir}/.zshrc-Linux ${ZDOTDIR}/.zshrc-Linux
ln -sf ${currentDir}/plugins.zsh ${ZDOTDIR}/plugins.zsh
ln -sf ${currentDir}/.p10k.zsh ${ZDOTDIR}/.p10k.zsh

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR}/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR}/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZDOTDIR}/zsh-completions
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZDOTDIR}/powerlevel10k

# TODO: deps
# p10k fonts
# env tools: jenv, pyenv, fnm...
# deps: zoxide ...

