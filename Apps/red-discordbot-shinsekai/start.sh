#!/bin/bash

# Start X virtual framebuffer in the background
Xvfb :99 -screen 0 1920x1080x24 &

# Start VNC server for remote access
x11vnc -display :99 -forever -nopw &

# Start OBS
obs --startvirtualcam --minimize-to-tray &

# Start VLC with a dummy interface (used for streaming)
cvlc --intf dummy &

# Start the Discord bot
/app/start-redbot.sh
