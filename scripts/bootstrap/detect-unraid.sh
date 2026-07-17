#!/usr/bin/env bash

###############################################################################
# detect-unraid.sh
#
# Detects whether the script is running on an Unraid system.
###############################################################################

detect_unraid() {

    echo
    echo "Checking Unraid..."

    if [[ ! -f /etc/unraid-version ]]; then
        log_error "Unraid not detected."
        return 1
    fi

    local VERSION
    VERSION=$(cat /etc/unraid-version)

    log_ok "Unraid detected."
    echo "      Version : ${VERSION}"

    return 0
}
