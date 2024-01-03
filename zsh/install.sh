#!/usr/bin/env bash

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
ln -sf ${currentDir}/.zshenv-path ${ZDOTDIR}/.zshenv-path
ln -sf ${currentDir}/.zprofile ${ZDOTDIR}/.zprofile
ln -sf ${currentDir}/.zshrc ${ZDOTDIR}/.zshrc
ln -sf ${currentDir}/plugins.zsh ${ZDOTDIR}/plugins.zsh
ln -sf ${currentDir}/.p10k.zsh ${ZDOTDIR}/.p10k.zsh

git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZDOTDIR}/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZDOTDIR}/zsh-syntax-highlighting
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZDOTDIR}/zsh-completions
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git ${ZDOTDIR}/powerlevel10k

# p10k fonts
# deps: fzf, zoxide, tldr, git-info, ...

# Arch
# pacman -S fd poppler ffmpegthumbnailer mediainfo imagemagick tar unzip

# Macos
# brew install coreutils fd poppler ffmpegthumbnailer mediainfo imagemagick

# Install mise, https://github.com/jdx/mise

# mise plugins install clojure
# mise use -g clojure

# mise use -g node
# npm config set registry https://registry.npmmirror.com

# mise plugins install pnpm
# mise use -g pnpm
# pnpm config set registry https://registry.npmmirror.com  # delete cache after changing register, [ -d $PNPM_HOME ] && rm -rf $PNPM_HOME
# pnpm add -g typescript-language-server typescript pyright

# mise install python@3.10
# mise use -g python@3.10
# python3 -m pip install --upgrade pip
# pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# python3 -m pip install --user --upgrade pipx
# python3 -m pipx ensurepath
# pipx install "pdm[all]"
# pipx install ruff
# pipx install black
# pipx install iredis
# mkdir -p ${ZDOTDIR:-$HOME}/completions
# pdm completion zsh > ${ZDOTDIR:-$HOME}/completions/_pdm
# pdm config pypi.url https://pypi.tuna.tsinghua.edu.cn/simple

# export MISE_FETCH_REMOTE_VERSIONS_TIMEOUT=60s
# mise install java@adoptopenjdk-8 # or zulu-8
# mise install java@adoptopenjdk-11
# mise install java@adoptopenjdk-17
# mise install java@adoptopenjdk-20
# mise use -g java@adoptopenjkd-20

# mise plugins install maven
# mise use -g maven@3

# NOTE: rust-analyzer必须在配置(gloabl/local)中比rust的位置靠前，不然path/shims就会先找到rust中的rust-analyzer安装脚本
# mise plugins install rust-analyzer
# mise use -g rust-analyzer

# mise plugins install rust
# mise use -g rust

# NOTE: after installing gopls, execute mise reshim to make a gopls shim in mise shims path for ide
# mise use -g go
# go install golang.org/x/tools/gopls@latest
# mise reshim

# mise plugins install act
# mise use -g act

# mise plugins install lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
# mise use -g lazydocker

# mise plugins install jq
# mise use -g jq

# mise plugins install k3d
# mise use -g k3d
# k3d completion zsh > ${ZDOTDIR:-$HOME}/completions/_k3d

# mise plugins install kubectl
# mise use -g kubectl
# kubectl completion zsh > ${ZDOTDIR:-$HOME}/completions/_kubectl

# mise plugins install k9s
# mise use -g k9s

# mise plugins install buildpack
# mise use -g buildpack
# pack completion --shell zsh
# cp ~/.pack/completion.zsh ${ZDOTDIR:-$HOME}/completions/_pack
