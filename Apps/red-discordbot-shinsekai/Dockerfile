FROM phasecorex/red-discordbot:full

# Add dependencies for streaming and controlling OBS, VLC, and a web browser
RUN apt-get update && apt-get install -y --no-install-recommends \
    x11vnc \
    xvfb \
    obs-studio \
    vlc \
    firefox-esr \
    xdotool \
    wmctrl \
    lxsession \
    openbox \
    lxde-core \
    lxterminal \
    dbus-x11 \
    ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up X virtual framebuffer for GUI applications
ENV DISPLAY=:99

# Expose the required ports for VNC and OBS WebSocket
EXPOSE 5900 4444

# Copy the entrypoint script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
