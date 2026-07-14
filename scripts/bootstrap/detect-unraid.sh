#!/usr/bin/env bash

###############################################################################
# detect-unraid.sh
#
# Detects whether the script is running on an Unraid system.
###############################################################################

detect_unraid() {

    if [[ ! -f "/etc/unraid-version" ]]; then
        echo "[ERROR] Unraid installation not detected."
        return 1
    fi

    local VERSION
    VERSION=$(cat /etc/unraid-version)

    echo "[OK] Unraid detected."
    echo "      Version : ${VERSION}"

    return 0
}
