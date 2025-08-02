#!/bin/bash

# Setup X Window system on MacOS and allow display from aibox.
# This script works on MacOS only!

# fail fast
set -eo pipefail
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

source lib/common.sh
ensure_install xquartz

# 1. Quit XQuartz if currently running
osascript -e 'tell application "XQuartz" to quit'

# 2. Set preference to allow TCP connections (enables "Allow connections from
# network clients")
defaults write org.xquartz.X11 nolisten_tcp -bool false

# 3. Launch XQuartz fresh
open -a XQuartz

# 4. Wait for X socket to become available
while ! [[ -e /tmp/.X11-unix/X0 ]]; do sleep 1; done

# 5. Allow local clients via xhost
# Run xhost in an xterm (XQuartz must launch it)
env DISPLAY=localhost:0 \
  xterm -e "xhost +localhost; echo 'GUI from vm is permitted. Press Enter to exit...'; read" &
