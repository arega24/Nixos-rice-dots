#!/usr/bin/env sh

rofi_command="rofi -demenu -i -theme /home/arega/.config/rofi/powermenu.rasi"

### Options ### 
power_off="Shutdown" 
reboot="Reboot" 
lock="Lock" 
suspend="Sleep" 
log_out="Logout"

# Variable passed to rofi 
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out" 

case "$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)" in     
	$power_off)
		poweroff
		;;
	$reboot)
		reboot
		;;
	$lock)
		betterlockscreen --lock blur
		;;
	$suspend)
		betterlockscreen --lock blur & systemctl suspend
		;;
	$log_out)
		pkill dwm
		;;
esac
