#!/bin/dash

while true; do
	xsetroot -name "$(date +"%V %a - %e %b %Y - %T "); \
$(acpi -b | sed -e 's/Battery 0: // ;' \
		-e 's/, / / ; ' \
		-e 's/Charging /⚡/ ;' \
		-e 's/Discharging // ;' \
		-e 's/\([0-9][0-9]\):\([0-6][0-9]\):\([0-6][0-9]\)/\1:\2/'
	#TODO: `awk` and `/proc/meminfo` instead of `free`
			) - $(top -b -n1 | grep -m 1 CPU: | awk '{print "CPU "$2"%"}') $(sensors | awk '/Package id 0:/ {print $4}' | sed s/+//
			) - MEM $(free | sed -n 2p | awk  '{x = 100 * $3 / $2; printf("%.0f%"), x}')"
	sleep 1s
done
# —   
# $(sed 's/$/%/' /sys/class/power_supply/BAT0/capacity)
# acpi -b | sed -e 's/Battery 0: // ; s/, / / ; s/Charging /⚡/ ; s/Discharging ; s/\([0-9][0-9]\):\([0-6][0-9]\):\([0-6][0-9]\)/\1:\2/'
# top -b -n1 | grep -m 1 CPU: | awk '{print "CPU "$2"%"}'
# free -h | sed -n 2p | awk '{print $3}'
