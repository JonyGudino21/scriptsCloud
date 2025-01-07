#!/bin/bash

# Activar el modo de depuración

INSTANCIA="MyInstance1"

# Obtener el estado de la instancia
STATUS_OUTPUT=$(syrus-apps-manager status "$INSTANCIA" 2>&1)
EXIT_CODE=$?

# Obtener un ID único, por ejemplo, usando timestamp en nanosegundos
ID=$(date +%s%N)

# Verificar el estado y estructurar la respuesta JSON
if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$(echo "$STATUS_OUTPUT" | grep -o '"status": "[^"]*"' | awk -F':' '{print $2}' | tr -d '"')
else
    STATUS="error"
fi



echo "$STATUS"

