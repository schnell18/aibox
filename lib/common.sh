function ensure_install {
    PKGS="$*"
    for PKG in $PKGS; do
        case $OS_DISTRO in
            macos)
                if ! brew list "$PKG" >/dev/null 2>&1; then
                    brew install "$PKG"
                fi
            ;;
            ubuntu)
                if ! dpkg -s "$PKG" >/dev/null 2>&1; then
                    sudo apt-get install -y "$PKG"
                fi
            ;;
            arch)
                if ! pacman -Q "$PKG" >/dev/null 2>&1; then
                    sudo pacman -S --noconfirm --needed "$PKG"
                fi
            ;;
            *)
                echo "Unsupported OS DISTRO: $OS_DISTRO" 1>&2
                exit 1
            ;;
        esac
    done
}
