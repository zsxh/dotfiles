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

# Arch
# pacman -S fd poppler ffmpegthumbnailer mediainfo imagemagick tar unzip

# Macos
# brew install coreutils fd poppler ffmpegthumbnailer mediainfo imagemagick

# Install rtx, https://github.com/jdxcode/rtx

# rtx plugins install clojure
# rtx use -g clojure

# rtx use -g node

# rtx plugins install pnpm
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

# pdm completion zsh > ~/.config/pdm/_pdm

# export RTX_FETCH_REMOTE_VERSIONS_TIMEOUT=60s
# rtx install java@adoptopenjdk-8 # or zulu-8
# rtx install java@adoptopenjdk-11
# rtx install java@adoptopenjdk-17
# rtx install java@adoptopenjdk-20
# rtx use -g java@adoptopenjkd-20

# rtx plugins install maven
# rtx use -g maven@3

# NOTE: rust-analyzer必须在配置(gloabl/local)中比rust的位置靠前，不然path/shims就会先找到rust中的rust-analyzer安装脚本
# rtx plugins install rust-analyzer
# rtx use -g rust-analyzer

# rtx plugins install rust
# rtx use -g rust

# NOTE: after installing gopls, execute rtx reshim to make a gopls shim in rtx shims path for ide
# rtx use -g go

# rtx plugins install act
# rtx use -g act

# rtx plugins install lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
# rtx use -g lazydocker

# rtx use -g jq
# rtx use -g k3d
