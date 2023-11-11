#!/bin/bash

set -e

#XDG
XDG_CONFIG_HOME=${HOME}/.config
XDG_DATA_HOME=${HOME}/.local/share
XDG_CACHE_HOME=${HOME}/.cache

currentDir=$(
  cd $(dirname "$0")
  pwd)

echo ${currentDir}

mkdir -p ${XDG_CONFIG_HOME=}/wezterm
ln -sf ${currentDir}/wezterm.lua ${XDG_CONFIG_HOME=}/wezterm/wezterm.lua
