#!/bin/sh

# Wayland
export WLR_BACKENDS=headless WLR_LIBINPUT_NO_DEVICES=1 WAYLAND_DISPLAY=wayland-1 WLR_RENDERER=pixman WLR_RENDERER_ALLOW_SOFTWARE=1

## XWayland
export DISPLAY=:0

## Sway

sway_started=$(pgrep -x sway > /dev/null 2>&1 && echo "true" || echo "false")
if [ $sway_started = "true" ] ; then
	pkill sway
fi

sway &

# For Sway runtime interaction
alias sway-runner='swaymsg -s $XDG_RUNTIME_DIR/sway-ipc.* exec'

# Set display mode. Less resolution = less memory. Somehow, we can get away with 1x1
sway-runner swaymsg output HEADLESS-1 mode 1x1

