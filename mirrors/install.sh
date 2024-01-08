#!/usr/bin/env bash

#XDG
XDG_CONFIG_HOME=${HOME}/.config
XDG_DATA_HOME=${HOME}/.local/share
XDG_CACHE_HOME=${HOME}/.cache

currentDir=$(
  cd $(dirname "$0")
  pwd)

ln -sf ${currentDir}/cargo ${XDG_DATA_HOME}/cargo
