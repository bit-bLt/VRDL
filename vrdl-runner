#!/bin/python3
# Modified from script provided by noframelimit

import subprocess
import time
import os
import threading

WINE_PREFIX="/opt/vrdl/prefix"

servers = [
    r'"/opt/vrdl/game/default/System/Dedicated_Server.exe" -dedicated -profile server1 -hide3d query_port 9000 -game_port 8000 -map_playlist Standard -ticks 100',
    r'"/opt/vrdl/game/default/System/Dedicated_Server.exe" -dedicated -profile server2 -hide3d query_port 9001 -game_port 8001 -map_playlist Standard -ticks 100',
]

def launch_and_monitor(cmd):
    while True:
        print(f"Starting: {cmd}")
        proc = subprocess.Popen(f"WINEPREFIX={WINE_PREFIX} wine {cmd}", shell=True)
        proc.wait()
        print(f"Process exited, restarting: {cmd}")
        time.sleep(10)

threads = []

for i, server_cmd in enumerate(servers):
    t = threading.Thread(target=launch_and_monitor, args=(server_cmd,))
    t.daemon = True
    t.start()
    threads.append(t)
    time.sleep(10)

try:
    while True:
        time.sleep(60)
except KeyboardInterrupt:
    print("Exiting main process.")
