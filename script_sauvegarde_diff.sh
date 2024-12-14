#!/bin/bash

# Variables
SOURCE_DIR="/home/vmS1/R1"   
DEST_USER="backup_user"       
DEST_HOST="192.168.1.100"     
DEST_DIR="/home/vmS2/R2"      
LOG_FILE="/var/log/sauvegarde_diff.log" # Fichier de log pour les sauvegardes différentielles
SNAPSHOT_FILE="/var/snapshot/last_snapshot" # Fichier pour snapshot

# Sauvegarde différentielle
rsync -avz --compare-dest="$DEST_DIR" "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR" --log-file="$LOG_FILE"

# Mise à jour du fichier snapshot
rsync -avz "$SOURCE_DIR" "$DEST_USER@$DEST_HOST:$DEST_DIR" --log-file="$LOG_FILE"
