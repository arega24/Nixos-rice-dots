#!/bin/bash

wal -l -n -i $1 
feh --bg-scale $1
sh $HOME/.config/zathura/zathura-pywal/dirzathurarc 
sh $HOME/.config/dunst/dunst-pywal/dirdunstrc 
dwmc reloadxrdb 
betterlockscreen -u $1