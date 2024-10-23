#!/bin/bash

# Skript zur Installation von Docker und Docker-Compose unter Debian

# Update und Upgrade des Systems
apt-get update && apt-get upgrade -y

# Notwendige Pakete installieren
apt-get install -y sudo ca-certificates curl git bpytop net-tools

# Verzeichnis für Docker GPG Schlüssel anlegen
install -m 0755 -d /etc/apt/keyrings

# Docker GPG Schlüssel herunterladen und ablegen
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc

# Berechtigungen für den GPG Schlüssel setzen
chmod a+r /etc/apt/keyrings/docker.asc

# Docker Repository hinzufügen
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Paketliste aktualisieren
apt-get update

# Docker und Docker Compose Plugin installieren
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Docker Compose herunterladen
curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Docker Compose ausführbar machen
chmod +x /usr/local/bin/docker-compose

# Installation abgeschlossen
echo "Docker und Docker-Compose wurden erfolgreich installiert."
