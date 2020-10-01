#!/bin/bash

WAL_FILE=~/.local/share/wallpaper

[[ $# == 1 ]]	&& ln -f $(readlink -f $1) $WAL_FILE
[[ $# -gt 1 ]]	&& echo "Za dużo argumentów" && exit

feh --bg-fill $WAL_FILE &
