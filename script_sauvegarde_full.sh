#!/bin/bash

# Variables
SOURCE_DIR="/home/vmS1/R1"    # Répertoire à sauvegarder (site web)
DEST_USER="backup_user"       # Utilisateur distant dédié aux sauvegardes
DEST_HOST="192.168.1.100"     # Adresse IP du serveur de sauvegarde
DEST_DIR="/home/vmS2/R2"      # Répertoire de destination sur le serveur distant
LOG_FILE="/var/log/sauvegarde_full.log"  # Fichier de log local


# Sauvegarde complète avec rsync
rsync -avz --delete "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR" >> "$LOG_FILE" 2>&1

# Vérification
if [ $? -eq 0 ]; then
    echo "Sauvegarde complète effectuée avec succès." >> "$LOG_FILE"
else
    echo "Erreur lors de la sauvegarde complète." >> "$LOG_FILE"
    exit 1
fi

