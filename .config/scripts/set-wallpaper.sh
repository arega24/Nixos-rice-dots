#!/bin/bash

wal -n -i $1 
feh --bg-scale $1
sh $HOME/.config/zathura/zathura-pywal/dirzathurarc 
sh $HOME/.config/dunst/dunst-pywal/dirdunstrc 
pkill dunst
dunstify Sucesso!!
dwmc reloadxrdb 
betterlockscreen -u $1