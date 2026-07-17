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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

###############################################################################

# Libraries

###############################################################################

source "${SCRIPT_DIR}/../lib/output.sh"

source "${SCRIPT_DIR}/../lib/config.sh"

###############################################################################

# Detection Modules

###############################################################################

source "${SCRIPT_DIR}/detect-unraid.sh"

source "${SCRIPT_DIR}/detect-lxc.sh"

source "${SCRIPT_DIR}/detect-storage.sh"

source "${SCRIPT_DIR}/detect-nvidia.sh"


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

    log_ok "Linux detected."
    detect_unraid
    detect_lxc
    detect_storage
    detect_nvidia
    
    echo
    echo "Bootstrap completed successfully."
}

main "$@"
