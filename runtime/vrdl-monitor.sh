#!/bin/sh

# If local vrdl-status, otherwise system-wide
if [ -e vrdl-status ]; then
	sudo watch -n 1 -e "./vrdl-status"
else 
	sudo watch -n 1 vrdl-status
fi
