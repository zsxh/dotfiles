#!/usr/bin/env bash

set -e

#XDG
XDG_CONFIG_HOME=${HOME}/.config

mkdir -p ${XDG_CONFIG_HOME}

currentDir=$(
  cd $(dirname "$0")
  pwd)

ln -sf ${currentDir}/skin.yml ${XDG_CONFIG_HOME}/k9s/skin.yml
