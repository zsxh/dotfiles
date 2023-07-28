#!/bin/bash

set -e

currentDir=$(
  cd $(dirname "$0")
  pwd)

ln -sf ${currentDir}/gitconfig ~/.gitconfig
