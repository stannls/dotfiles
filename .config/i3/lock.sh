#!/bin/bash
kill -STOP $(pidof lxqt-notificationd)
i3lockr -b 25
kill -CONT $(pidof lxqt-notificationd)
