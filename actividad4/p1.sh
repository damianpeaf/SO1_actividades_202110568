#!/bin/bash

# Definir las direcciones de los named pipes
PIPE_FROM_PARTICIPANT1="participant2_to_participant1"
PIPE_TO_PARTICIPANT1="participant1_to_participant2"

# Crear los named pipes si no existen
if [ ! -p "$PIPE_FROM_PARTICIPANT1" ]; then
    mkfifo "$PIPE_FROM_PARTICIPANT1"
fi

if [ ! -p "$PIPE_TO_PARTICIPANT1" ]; then
    mkfifo "$PIPE_TO_PARTICIPANT1"
fi

# Loop para recibir y enviar mensajes
while true; do
    # Recibir mensaje del participante 2
    read message < "$PIPE_FROM_PARTICIPANT1"
    echo "Participant 2: $message"

    # Solicitar mensaje y enviar al participante 2
    read -p "Participant 1: " message
    echo "Participant 1: $message" > "$PIPE_TO_PARTICIPANT1"
done
