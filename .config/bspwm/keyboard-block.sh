while true
do
	kb_state=$(lsusb | grep "DZ60")
	if [ -n "$kb_state" ]; then
		echo "External keyboard"
		setxkbmap us
		xinput --set-prop 10 163 0
	else
		echo "No External keyboard"
		setxkbmap de
		xinput --set-prop 10 163 1
	fi
	sleep 1
done
