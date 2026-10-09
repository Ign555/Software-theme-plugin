#!/bin/bash
CLAVIER_VIRTUEL="/usr/share/applications/com.github.maliit.keyboard.desktop"
NOM_CLAVIER="KEYZ TITANIUM"
ETAT=""
while true; do
    if grep -qi "$NOM_CLAVIER" /proc/bus/input/devices; then
        NOUVEL_ETAT="branche"
    else
        NOUVEL_ETAT="detache"
    fi
    if [ "$NOUVEL_ETAT" != "$ETAT" ]; then
        if [ "$NOUVEL_ETAT" = "branche" ]; then
            kwriteconfig6 --notify --file kwinrc --group Wayland --key InputMethod ""
        else
            kwriteconfig6 --notify --file kwinrc --group Wayland --key InputMethod "$CLAVIER_VIRTUEL"
        fi
        ETAT="$NOUVEL_ETAT"
    fi
    sleep 2
done
