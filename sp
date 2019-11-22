#!/bin/dash

pacman -Ss $1 --color=always | less -r
