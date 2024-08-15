#!/bin/bash

# Vérifiez si un serveur X est déjà en cours d'exécution
if ! pgrep -x "Xvfb" > /dev/null; then
    echo "Starting X virtual framebuffer..."
    Xvfb :99 -screen 0 1920x1080x24 &
    sleep 2  # Attendez que Xvfb démarre correctement
else
    echo "X virtual framebuffer already running."
fi

# Vérifiez si un serveur VNC est déjà en cours d'exécution
if ! pgrep -x "x11vnc" > /dev/null; then
    echo "Starting VNC server..."
    x11vnc -display :99 -forever -nopw &
else
    echo "VNC server already running."
fi

# Démarrez l'environnement de bureau XFCE
echo "Starting XFCE4 desktop environment..."
startxfce4 &

# Démarrez le bot Discord
echo "Starting Discord bot..."
/app/start-redbot.sh
