#!/bin/bash

# Obtener el valor de la variable de entorno GITHUB_USER
GITHUB_USER=$GITHUB_USER

# Verificar si la variable de entorno está definida
if [ -z "$GITHUB_USER" ]; then
    echo "La variable de entorno GITHUB_USER no está definida."
    exit 1
fi

# Consultar la URL de GitHub API
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s "$API_URL")

# Extraer datos del JSON
ID=$(echo "$JSON_RESPONSE" | jq -r '.id')
CREATED_AT=$(echo "$JSON_RESPONSE" | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT."

# Crear un directorio temporal para el log
LOG_DIR="/tmp/$(date +'%Y%m%d')"
mkdir -p "$LOG_DIR"

# Crear el log file
LOG_FILE="$LOG_DIR/saludos.log"
echo "$(date +'%Y-%m-%d %H:%M:%S') - Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT." >> "$LOG_FILE"

echo "Log creado en: $LOG_FILE"
