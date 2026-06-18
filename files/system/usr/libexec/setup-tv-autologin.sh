#!/bin/bash
CONFIG_DIR="/etc/plasmalogin.conf.d"
CONFIG_FILE="$CONFIG_DIR/10-autologin.conf"

# Wenn die Datei schon existiert, ist die Arbeit bereits erledigt
if [ -f "$CONFIG_FILE" ]; then
    exit 0
fi

# Finde den Hauptbenutzer (die User-ID 1000 wird bei der Fedora-Installation vergeben)
MAIN_USER=$(getent passwd 1000 | cut -d: -f1)

# Wenn ein Nutzer gefunden wurde, schreibe die Autologin-Konfiguration
if [ -n "$MAIN_USER" ]; then
    mkdir -p "$CONFIG_DIR"
    echo "[Autologin]" > "$CONFIG_FILE"
    echo "User=$MAIN_USER" >> "$CONFIG_FILE"
    echo "Session=plasma-bigscreen-wayland" >> "$CONFIG_FILE"
fi
