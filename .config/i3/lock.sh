#!/bin/bash
pkill -u "$USER" -USR1 dunst
i3lockr -b 25
pkill -u "$USER" -USR2 dunst
