#!/bin/bash

set -e

#XDG
XDG_CONFIG_HOME=${HOME}/.config
XDG_DATA_HOME=${HOME}/.local/share
XDG_CACHE_HOME=${HOME}/.cache
# zsh
ZDOTDIR=${XDG_CONFIG_HOME}/zsh

mkdir -p ${ZDOTDIR}

currentDir=$(
  cd $(dirname "$0")
  pwd)

echo ${currentDir}

ln -sf ${currentDir}/.zshenv ~/.zshenv
ln -sf ${currentDir}/.zprofile ${ZDOTDIR}/.zprofile
ln -sf ${currentDir}/.zshrc ${ZDOTDIR}/.zshrc
ln -sf ${currentDir}/.zshrc-Linux ${ZDOTDIR}/.zshrc-Linux
ln -sf ${currentDir}/.zshrc-Darwin ${ZDOTDIR}/.zshrc-Darwin
ln -sf ${currentDir}/plugins.zsh ${ZDOTDIR}/plugins.zsh
ln -sf ${currentDir}/.p10k.zsh ${ZDOTDIR}/.p10k.zsh

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR}/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR}/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZDOTDIR}/zsh-completions
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZDOTDIR}/powerlevel10k

# p10k fonts
# deps: fzf, zoxide, tldr ...

# Macos
# brew install coreutils

# TODO: install rtx, jenv

# rtx plugins install clojure
# rtx install clojure@1.11
# rtx use -g clojure@1.11

# rtx install node@20
# rtx use -g node@20

# rtx plugins install pnpm
# rtx install pnpm
# rtx use -g pnpm
# pnpm add -g typescript-language-server typescript pyright

# rtx install python@3.10
# rtx use -g python@3.10
# python3 -m pip install --user --upgrade pipx
# python3 -m pipx ensurepath
# pipx install "pdm[all]"
# pipx install ruff
# pipx install black
# pipx install iredis

# export RTX_FETCH_REMOTE_VERSIONS_TIMEOUT=60s
# rtx install java@adoptopenjdk-8.0.382+5 # or zulu 8
# rtx install java@adoptopenjdk-11.0.20+8
# rtx install java@adoptopenjdk-17.0.8+7
# rtx install java@adoptopenjdk-20.0.2+9
# rtx use -g java@adoptopenjdk-20.0.2+9

# rtx install plugins maven
# rtx install maven
# rtx use -g maven
