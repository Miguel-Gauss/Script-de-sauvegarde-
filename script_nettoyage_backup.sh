#!/bin/bash

# Variables
DEST_DIR="/home/vmS2/R2"
DIFF_LIMIT=7       	# Jours pour sauvegardes différentielles
WEEKLY_LIMIT=28    	# Jours pour sauvegardes complètes hebdomadaires
MONTHLY_LIMIT=180  	# Jours pour sauvegardes complètes mensuelles
LOG_FILE="/var/log/nettoyage_backup.log"  # Fichier de log pour le nettoyage

# Supprimer les sauvegardes différentielles âgées de plus de 7 jours
find "$DEST_DIR/diff/" -type f -mtime +$DIFF_LIMIT -exec rm -f {} \; >> "$LOG_FILE" 2>&1

# Supprimer les sauvegardes hebdomadaires âgées de plus de 4 semaines
find "$DEST_DIR/weekly/" -type f -mtime +$WEEKLY_LIMIT -exec rm -f {} \; >> "$LOG_FILE" 2>&1

# Supprimer les sauvegardes mensuelles âgées de plus de 6 mois
find "$DEST_DIR/monthly/" -type f -mtime +$MONTHLY_LIMIT -exec rm -f {} \; >> "$LOG_FILE" 2>&1

echo "Nettoyage terminé." >> "$LOG_FILE"

