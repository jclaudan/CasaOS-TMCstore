FROM phasecorex/red-discordbot:full

# Add dependencies for streaming, controlling OBS, VLC, and a web browser
# Add v4l2loopback for virtual camera support and install the latest OBS Studio from source or PPA

# Setup the environment to get the latest OBS Studio
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:obsproject/obs-studio \
    && apt-get update && apt-get install -y --no-install-recommends \
    x11vnc \
    xvfb \
    obs-studio \
    vlc \
    firefox-esr \
    xdotool \
    wmctrl \
    xfce4 \
    xfce4-terminal \
    dbus-x11 \
    ffmpeg \
    v4l2loopback-dkms \
    v4l2loopback-utils \
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
