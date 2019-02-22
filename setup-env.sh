#!/bin/bash

files=(
  .vimrc
  .zprofile
  .tmux.conf
  init.vim
)

for f in ${files[@]}
do
  if [ $f == 'init.vim' ]
  then
    ln -sf $PWD/$f $HOME/.config/nvim/$f
  else
    ln -sf $PWD/$f $HOME/$f
  fi
done
