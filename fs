#!/bin/dash
$EDITOR "$(du -a ~/Szkoła/ | sed 's/^[0-9]*\s//g' | fzf)"

