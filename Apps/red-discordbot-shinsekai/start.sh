#!/bin/bash

# Check if a display server is already running
if ! pgrep -x "Xvfb" > /dev/null; then
    echo "Starting X virtual framebuffer..."
    Xvfb :99 -screen 0 1920x1080x24 &
    sleep 2  # Attendre que Xvfb démarre correctement
else
    echo "X virtual framebuffer already running."
fi

# Check if a VNC server is already running
if ! pgrep -x "x11vnc" > /dev/null; then
    echo "Starting VNC server..."
    x11vnc -display :99 -forever -nopw &
else
    echo "VNC server already running."
fi

# Start the Discord bot
echo "Starting Discord bot..."
/app/start-redbot.sh
