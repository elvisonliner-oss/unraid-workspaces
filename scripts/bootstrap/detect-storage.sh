#!/usr/bin/env bash

###############################################################################
# detect-storage.sh
#
# Checks whether the storage location for Unraid Workspaces exists.
###############################################################################

STORAGE_ROOT="/mnt/docker_data/unraid-workspaces"

detect_storage() {

    echo
    echo "Checking storage..."

    if [[ ! -d "/mnt/docker_data" ]]; then
        echo "[ERROR] /mnt/docker_data not found."
        return 5
    fi

    echo "[OK] Storage root found."
    echo "      Path : /mnt/docker_data"

    if [[ ! -d "${STORAGE_ROOT}" ]]; then
        echo "[INFO] Workspace directory does not exist yet."
        echo "       It will be created during installation."
    else
        echo "[OK] Workspace directory found."
        echo "      Path : ${STORAGE_ROOT}"
    fi

    return 0
}
