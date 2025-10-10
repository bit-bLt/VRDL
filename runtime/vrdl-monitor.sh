#!/bin/sh

# If local vrdl-status, otherwise system-wide
if [ -e vrdl-status ]; then
	sudo watch -n 0.4 -e "./vrdl-status"
else 
	sudo watch -n 0.4 vrdl-status
fi
