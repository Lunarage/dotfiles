#!/bin/bash


# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

# Find all moitors
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown &
    done
else
    polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown &
fi