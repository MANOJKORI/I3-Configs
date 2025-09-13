#!/bin/bash
sleep 2

# Detect connected monitors
Connected_Monitors=$(xrandr | grep " connected")

Laptop="eDP-1"
External="HDMI-1"

if echo "$Connected_Monitors" | grep -q "$External"; then
    # External monitor is connected
    xrandr --output "$External" --primary --mode 1920x1080 --output "$Laptop" --off
else
    # Only laptop screen is connected
    xrandr --output "$Laptop" --primary --mode 1366x768 --output "$External" --off
fi
