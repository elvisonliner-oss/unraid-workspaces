#!/usr/bin/env bash

###############################################################################
# Unraid Workspaces
#
# bootstrap.sh
#
# Initial bootstrap script
#
# Version: 0.1.0-alpha
###############################################################################

set -euo pipefail

UWS_VERSION="0.1.0-alpha"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/detect-unraid.sh"

print_header() {
    echo
    echo "========================================================"
    echo "             Unraid Workspaces Bootstrap"
    echo "========================================================"
    echo
    echo "Version : ${UWS_VERSION}"
    echo "Date    : $(date)"
    echo "Host    : $(hostname)"
    echo
}

check_linux() {
    if [[ "$(uname -s)" != "Linux" ]]; then
        echo "[ERROR] This script must be executed on Linux."
        exit 1
    fi
}

main() {
    print_header
    check_linux

    echo "[OK] Linux detected."
    detect_unraid
    echo
    echo "Bootstrap completed successfully."
}

main "$@"
