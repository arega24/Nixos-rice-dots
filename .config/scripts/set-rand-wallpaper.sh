#!/bin/sh

file=$(find "$HOME/Imagens/Wallpaper_Shuffle/" -type f | shuf -n 1)

wal -n -i $file
feh --bg-scale $file
sh $HOME/.config/zathura/zathura-pywal/dirzathurarc 
sh $HOME/.config/dunst/dunst-pywal/dirdunstrc 
dwmc reloadxrdb 
pkill dunst