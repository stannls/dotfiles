#!/bin/sh
#source https://github.com/x70b1/polybar-scripts

LOCK=/tmp/checkupdatelock
while [ -f "$LOCK" ]; do
sleep 0.2
done

touch /tmp/checkupdatelock
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
rm /tmp/checkupdatelock
