# Utiliser Ubuntu 22.04 comme base pour assurer la compatibilité avec les dernières versions de logiciels
FROM ubuntu:22.04 AS base

# Désactiver les interactions pendant l'installation des paquets
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Ajouter les dépendances nécessaires pour Red-DiscordBot et les applications de streaming
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    build-essential \
    git \
    libsodium-dev \
    libffi-dev \
    jq \
    openssh-client \
    x11vnc \
    xvfb \
    obs-studio \
    vlc \
    firefox \
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

# Configurer le script de point d'entrée pour PhasecoreX
ADD https://raw.githubusercontent.com/PhasecoreX/docker-user-image/master/user-entrypoint.sh /bin/user-entrypoint
RUN chmod +x /bin/user-entrypoint && /bin/user-entrypoint --init

ENTRYPOINT ["/bin/user-entrypoint"]

# Configurer les emplacements de configuration
RUN mkdir -p /root/.config/Red-DiscordBot && \
    mkdir -p /usr/local/share/Red-DiscordBot && \
    mkdir -p /config/.config/Red-DiscordBot

VOLUME /data

# Configurer les variables d'environnement pour Red-DiscordBot
ENV SODIUM_INSTALL=system

# Configurer les variables d'environnement pour les applications graphiques
ENV DISPLAY=:99

# Exposer les ports nécessaires pour VNC et OBS WebSocket
EXPOSE 5900 4444

# Copier les fichiers root dans l'image Docker
COPY root/ /

# Définir la commande à exécuter au démarrage du conteneur
CMD ["/app/start-redbot.sh"]

# Étape pour configurer et démarrer le serveur Xvfb, VNC, et les autres services
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Construction finale qui exécute tout
FROM base AS final

# Démarrer tout via le script start.sh
CMD ["/start.sh"]
