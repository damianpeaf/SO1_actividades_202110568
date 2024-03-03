#!/bin/bash

# Definir las direcciones de los named pipes
PIPE_FROM_PARTICIPANT2="participant1_to_participant2"
PIPE_TO_PARTICIPANT2="participant2_to_participant1"

# Crear los named pipes si no existen
if [ ! -p "$PIPE_FROM_PARTICIPANT2" ]; then
    mkfifo "$PIPE_FROM_PARTICIPANT2"
fi

if [ ! -p "$PIPE_TO_PARTICIPANT2" ]; then
    mkfifo "$PIPE_TO_PARTICIPANT2"
fi

# Loop para recibir y enviar mensajes
while true; do
    # Solicitar mensaje y enviar al participante 1
    read -p "Participant 2: " message
    echo "$message" > "$PIPE_TO_PARTICIPANT2"

    # Recibir mensaje del participante 1
    read message < "$PIPE_FROM_PARTICIPANT2"
    echo "$message"
done
