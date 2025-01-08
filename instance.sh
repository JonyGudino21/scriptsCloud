#!/bin/bash

# Nombre del archivo: instance.sh
# Uso:
#   chmod +x create_and_start_instance.sh
#   ./instance.sh <instance_name> <app_name> <app_version>
#
# Ejemplo:
#   ./instance.sh MyInstance1 myapp 1.0.0

# -----------------------------------------------------------------------------
# Validamos que se hayan pasado exactamente 3 argumentos
# -----------------------------------------------------------------------------
#if [ $# -ne 3 ]; then
#  echo "Uso: $0 <instance_name> <app_name> <app_version>"
#  exit 1
#fi

# -----------------------------------------------------------------------------
# Recibimos los argumentos en variables:
#   $1 = Primer argumento (instance_name)
#   $2 = Segundo argumento (app_name)
#   $3 = Tercer argumento (app_version)
# -----------------------------------------------------------------------------
INSTANCE_NAME="instance1"
APP_NAME="myapp"
APP_VERSION="1.0.0"

# -----------------------------------------------------------------------------
# 1. Crear la instancia
#    - Usamos '||' para capturar si el comando falla; si falla, detenemos el script.
# -----------------------------------------------------------------------------
#syrus-apps-manager create-instance "$INSTANCE_NAME" "$APP_NAME" "$APP_VERSION" || {
#  echo "Error: No se pudo crear la instancia $INSTANCE_NAME"
#  exit 1
#}

# -----------------------------------------------------------------------------
# 2. Iniciar la instancia
#    - Mismo control de error que arriba, en caso de fallar la ejecución.
# -----------------------------------------------------------------------------
syrus-apps-manager start "$INSTANCE_NAME" || {
  echo "Error: No se pudo iniciar la instancia $INSTANCE_NAME"
  exit 1
}

# -----------------------------------------------------------------------------
# 3. Mostrar contenido de logs
#    - Verificamos que el archivo de logs exista antes de imprimirlo.
# -----------------------------------------------------------------------------
LOG_FILE="/data/logs/${INSTANCE_NAME}-out.log"
if [ -f "$LOG_FILE" ]; then
  echo "Leyendo archivo línea por línea:"
  while IFS= read -r line; do
    echo "$line"
  done < "$LOG_FILE"
else
  echo "Error: No se encontró el archivo de logs $LOG_FILE"
  exit 1
fi
