#!/bin/bash

# Start X virtual framebuffer in the background
Xvfb :99 -screen 0 1920x1080x24 &

# Start VNC server for remote access
x11vnc -display :99 -forever -nopw &

# Start the LXDE desktop environment
lxsession &

# Start the Discord bot
/app/start-redbot.sh
