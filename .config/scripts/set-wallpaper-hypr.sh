#!/usr/bin/env bash

blurred_wp="$HOME/.wallpapers/current_wallpaper"

wal -n -i $1 
sh $HOME/.config/zathura/zathura-pywal/dirzathurarc 
sh $HOME/.config/dunst/dunst-pywal/dirdunstrc 
pkill dunst
dunstify Sucesso!!

# launch waybar based on new wallpaper colors
source "$HOME/.cache/wal/colors.sh"
~/.config/waybar/launch.sh

# switch to new wallpaper with swww
#transition_type="grow"
#transition_type="wipe"
#transition_type="random"
#transition_type="outer"

swww img $1 #\
#    --transition-type=$transition_type \
#    --transition-pos 0.85,0.98 \
#    --transition-step 95

# create wallpaper (for wlogout)
cp $1 $blurred_wp