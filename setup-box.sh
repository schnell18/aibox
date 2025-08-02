#!/bin/bash

# Setup lima and create aibox.
# This script works on MacOS only!

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
        echo "= Installing aibox dependencies...                "
        echo "=================================================="
        ensure_install lima
        echo "= Starting aibox ...                              "
        limactl -y start aibox.yaml
        echo "=================================================="
        echo "= Setup done!                                     "
        echo "= Start hacking by typing 'limactl shell aibox' ! "
        echo "=================================================="
    fi
}

[[ -z $DEBUG_SETUP ]] || set -x
source lib/common.sh
setup
