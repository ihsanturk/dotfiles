br_path="/sys/class/backlight/intel_backlight"
brgh=$(cat ${br_path}/brightness)
max_brgh=$(cat ${br_path}/max_brightness)

if [ $1 ]; then
	if [ $1 == "m" ]; then 
		sudo echo "$max_brgh" > ${br_path}/brightness
	elif [ $1 == "i" ]; then
		if [ $2 ]; then
			if [ $brgh -ge 7500 ]; then
				exit 1
			else
				sudo echo "$(($brgh+$2))" > ${br_path}/brightness
			fi
		else
			if [ $brgh -ge 7500 ]; then
				exit 1
			else
				sudo echo "$(($brgh+300))" > ${br_path}/brightness
			fi
		fi
	elif [ $1 == "d" ]; then
		if [ $2 ]; then
			if [ $brgh -le 1000 ]; then
				exit 1
			else
				sudo echo "$(($brgh-$2))" > ${br_path}/brightness
			fi
		else
			if [ $brgh -le 1000 ]; then
				exit 1
			else
				sudo echo "$(($brgh-300))" > ${br_path}/brightness
			fi
		fi
	fi
else
	if [ $brgh  -ge 6500 ]; then
		exit 1
	else
		sudo echo "$(($brgh+300))" > ${br_path}/brightness
	fi
fi
