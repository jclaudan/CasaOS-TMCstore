#!/bin/bash

# Supprimer les anciens verrous de serveur X pour éviter les conflits
if [ -e /tmp/.X99-lock ]; then
    echo "Removing existing X server lock file..."
    rm -f /tmp/.X99-lock
fi

# Démarrer le cadre tampon X virtuel (Xvfb) en arrière-plan
echo "Starting X virtual framebuffer..."
Xvfb :99 -screen 0 1920x1080x24 &

# Attendre que Xvfb démarre correctement
sleep 2

# Démarrer le serveur VNC pour l'accès à distance
echo "Starting VNC server..."
x11vnc -display :99 -forever -nopw &

# Attendre que VNC démarre correctement
sleep 2

# Démarrer l'environnement de bureau XFCE
echo "Starting XFCE4 desktop environment..."
startxfce4 &

# Démarrer le bot Discord
echo "Starting Discord bot..."
/app/start-redbot.sh
