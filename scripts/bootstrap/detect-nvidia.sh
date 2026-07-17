#!/usr/bin/env bash

###############################################################################
# detect-nvidia.sh
#
# Detects NVIDIA GPU support on the host.
###############################################################################

detect_nvidia() {

    echo
    echo "Checking NVIDIA..."

    if ! command -v nvidia-smi >/dev/null 2>&1; then
        echo "[ERROR] nvidia-smi not found."
        return 3
    fi

    local GPU_NAME
    GPU_NAME=$(nvidia-smi --query-gpu=name --format=csv,noheader | head -n1)

    local DRIVER_VERSION
    DRIVER_VERSION=$(nvidia-smi --query-gpu=driver_version --format=csv,noheader | head -n1)

    echo "[OK] NVIDIA detected."
    echo "      GPU    : ${GPU_NAME}"
    echo "      Driver : ${DRIVER_VERSION}"

    return 0
}
