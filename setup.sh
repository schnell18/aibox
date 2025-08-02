#!/bin/bash

# fail fast
set -eo pipefail

function setup {
    comps="$*"

    OS_DISTRO="macos"
    _OS=$(uname)
    case $_OS in
        Darwin)
            OS_DISTRO="macos"
        ;;
        *)
            echo "Unsupported OS: $_OS" 1>&2
            exit 1
        ;;
    esac

    # ensure pre-requisite software are installed: stow, homebrew (MacOS only)
    if [[ $OS_DISTRO == "macos" ]]; then
        echo "=================================================="
        echo "= Setting up aibox dependencies                   "
        echo "=================================================="
        ensure_install lima
        limactl -y start aibox.yaml
        echo "=================================================="
        echo "= setup done!                                     "
        echo "=================================================="
    fi
}

[[ -z $DEBUG_SETUP ]] || set -x
source lib/common.sh
setup
