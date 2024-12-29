#!/bin/sh

ram() {
	mem=$(free -h | awk '/Mem:/ { print $3 }' | cut -f1 -d 'i')
	echo   "$mem"
}

bat(){

    battery_info=$(acpi -b | sed -n '2p')
    battery_status=$(echo "$battery_info" | awk '{print $3}' | sed 's/,$//') 

	if [ "$battery_status" = "Charging" ]; then
        BAT=" "
    elif [ "$battery_status" = "Discharging" ]; then
    	BAT=" "
    fi

	bat=$(cat /sys/class/power_supply/BAT1/capacity)
	echo "$BAT" "$bat"%
}

cpu() {
	read -r cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read -r cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo  "$cpu"%
}

network() {
	conntype=$(ip route | awk '/default/ { print substr($5,1,1) }')

	if [ -z "$conntype" ]; then
		echo " down"
	elif [ "$conntype" = "e" ]; then
		echo " up"
	elif [ "$conntype" = "w" ]; then
		echo " up"
	fi
}

volume_pa() {

	
	muted=$(pamixer --get-mute)
	vol=$(pamixer --get-volume)

	if [ "$muted" = "true" ]; then
		echo ""
	else
		if [ "$vol" -ge 65 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 40 ]; then
			echo " $vol%"
		elif [ "$vol" -ge 0 ]; then
			echo " $vol%"	
		fi
	fi

}

clock() {
	dte=$(date +"%A %d-%b-%Y")
	time=$(date +"%H:%M")

	echo "$dte | $time"
}

while true; do
	xsetroot -name " $(ram)  $(cpu)  $(volume_pa)  $(clock) "
#    sleep 0,0001s
done &
