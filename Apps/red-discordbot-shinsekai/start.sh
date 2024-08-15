#!/bin/bash

# Démarrer Xvfb (serveur X virtuel)
if ! pgrep -x "Xvfb" > /dev/null; then
    echo "Starting X virtual framebuffer..."
    Xvfb :99 -screen 0 1920x1080x24 &
    sleep 2  # Attendre que Xvfb démarre correctement
else
    echo "Xvfb is already running."
fi

# Démarrer le serveur VNC
if ! pgrep -x "x11vnc" > /dev/null; then
    echo "Starting VNC server..."
    x11vnc -display :99 -forever -nopw &
else
    echo "VNC server is already running."
fi

# Démarrer le bot Discord
echo "Starting Discord bot..."
/app/start-redbot.sh
