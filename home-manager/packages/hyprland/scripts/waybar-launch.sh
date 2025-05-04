#!/usr/bin/env sh

pkill waybar
sleep 0.2

waybar -c ~/.config/waybar/waybar.config -s ~/.config/waybar/waybar-black.css &

