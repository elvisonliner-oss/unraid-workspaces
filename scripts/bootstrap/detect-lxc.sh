#!/usr/bin/env bash

###############################################################################
# detect-lxc.sh
#
# Detects whether the LXC tools are available on the host.
###############################################################################

detect_lxc() {

    echo
    echo "Checking LXC..."

    if command -v lxc >/dev/null 2>&1; then

        local VERSION
        VERSION=$(lxc --version 2>/dev/null || echo "unknown")

        echo "[OK] LXC detected."
        echo "      Version : ${VERSION}"

        return 0
    fi

    echo "[ERROR] LXC command not found."
    return 2
}
