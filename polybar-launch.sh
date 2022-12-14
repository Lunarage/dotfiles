#!/bin/bash


# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

# Find Ethernet
ETH=$(ip link | sed -n "s/^.*\(enp[0-9a-z]*\).*state UP.*$/\1/p" | head -n 1)

# Find Wlan
WLAN=$(ip link | sed -n "s/^.*\(wlp[0-9a-z]*\).*state UP.*$/\1/p" | head -n 1)

# Find primary monitor
PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
# Find other monitors
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# Launch on primary monitor
ETH=$ETH MONITOR=$PRIMARY WLAN=$WLAN polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown &
sleep 1

# Launch on other monitors
for monitor in $OTHERS; do
    ETH=$ETH MONITOR=$monitor WLAN=$WLAN polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown &
done
