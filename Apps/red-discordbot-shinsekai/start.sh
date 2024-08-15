#!/bin/bash

# Load v4l2loopback module for virtual camera support
modprobe v4l2loopback devices=1 video_nr=10 card_label="OBS Virtual Camera" exclusive_caps=1

# Start X virtual framebuffer in the background
Xvfb :99 -screen 0 1920x1080x24 &

# Start VNC server for remote access
x11vnc -display :99 -forever -nopw &

# Start the XFCE4 desktop environment
startxfce4 &

# Start OBS in minimized mode with Virtual Camera enabled.
obs --startvirtualcam --minimize-to-tray &

# Start the Discord bot
/app/start-redbot.sh
