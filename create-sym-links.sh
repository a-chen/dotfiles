#!/bin/bash
#######################
# create symlinks to dot files in this repository
######################

# move only if file exists
[ ! -f ~/.vimrc ] || mv -v ~/.vimrc ~/.vimrc.bak
ln -s ~/code/dotfiles/.vimrc ~/.vimrc

