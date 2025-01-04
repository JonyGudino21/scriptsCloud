#!/usr/bin/env bash

# Activar el modo de depuración
set -x

# Ejecutar el comando y capturar la respuesta
OUTPUT=$(syrus-apps-manager status MyInstance1)

# Verificar si el comando se ejecutó correctamente
if [ $? -ne 0 ]; then
    echo "Error al ejecutar el comando syrus-apps-manager."
    exit 1
fi

# Mostrar la respuesta
echo "Respuesta del dispositivo:"
echo "$OUTPUT"

# Desactivar el modo de depuración
set +x
