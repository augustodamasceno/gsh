#!/usr/bin/env bash
#
# gsh - Installs all runtime dependencies for gsh scripts
#
# Copyright (c) 2015-2026, Augusto Damasceno.
# All rights reserved.
# SPDX-License-Identifier: GPL-3.0
#
# See https://github.com/augustodamasceno/gsh
#
# Usage: install-deps.sh [-y]
#   -y  non-interactive, assume yes

BOLD='\033[1m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

AUTO_YES=0
[[ "${1:-}" == "-y" ]] && AUTO_YES=1

info()    { printf "${CYAN}${BOLD}[INFO]${RESET}  %s\n" "$1"; }
success() { printf "${GREEN}${BOLD}[OK]${RESET}    %s\n" "$1"; }
warn()    { printf "${YELLOW}${BOLD}[WARN]${RESET}  %s\n" "$1"; }
error()   { printf "${RED}${BOLD}[ERROR]${RESET} %s\n" "$1"; }

declare -A DEPS=(
    # Core utilities
    [openssl]="openssl"
    [gpg]="gnupg2"
    [rsync]="rsync"
    [pv]="pv"
    [lsof]="lsof"
    # Process / system tools
    [nmap]="nmap"
    [mpstat]="sysstat"
    [numactl]="numactl"
    [dmidecode]="dmidecode"
    [lspci]="pciutils"
    # Image / document tools
    [convert]="imagemagick"
    [identify]="imagemagick"
    [pdftk]="pdftk"
    [qrencode]="qrencode"
    # Python virtualenvs
    [python3]="python3"
    # File rename utility
    [rename]="rename"
    # Video download
    [yt-dlp]="yt-dlp"
)

detect_pkg_manager() {
    if command -v apt-get &>/dev/null; then echo "apt"
    elif command -v dnf &>/dev/null;     then echo "dnf"
    elif command -v pacman &>/dev/null;  then echo "pacman"
    elif command -v zypper &>/dev/null;  then echo "zypper"
    elif command -v pkg &>/dev/null && [[ "$(uname)" == "FreeBSD" ]]; then echo "pkg"
    elif command -v brew &>/dev/null;    then echo "brew"
    else echo "unknown"
    fi
}

install_pkg() {
    local pkg="$1"
    local mgr
    mgr=$(detect_pkg_manager)
    case "$mgr" in
        apt)    sudo apt-get install -y --no-install-recommends "$pkg" ;;
        dnf)    sudo dnf install -y "$pkg" ;;
        pacman) sudo pacman -S --noconfirm "$pkg" ;;
        zypper) sudo zypper install -y "$pkg" ;;
        pkg)    sudo pkg install -y "$pkg" ;;
        brew)   brew install "$pkg" ;;
        *)
            error "Unknown package manager — install '$pkg' manually."
            return 1
            ;;
    esac
}

# FreeBSD package name overrides (differ from the Linux defaults)
declare -A DEPS_FREEBSD=(
    [gpg]="gnupg"
    [mpstat]="sysutils/sysstat"
    [convert]="ImageMagick7"
    [identify]="ImageMagick7"
    [pdftk]="pdftk-java"
    [rename]="p5-File-Rename"
    [yt-dlp]="yt-dlp"
    [numactl]=""          # not available on FreeBSD
    [dmidecode]="dmidecode"
    [lspci]="pciutils"
)

# Merge FreeBSD overrides into DEPS if on FreeBSD
if [[ "$(uname)" == "FreeBSD" ]]; then
    for cmd in "${!DEPS_FREEBSD[@]}"; do
        DEPS[$cmd]="${DEPS_FREEBSD[$cmd]}"
    done
fi

missing_cmds=()
missing_pkgs=()

for cmd in "${!DEPS[@]}"; do
    pkg_name="${DEPS[$cmd]}"
    # Skip entries explicitly marked unavailable on this platform
    [[ -z "$pkg_name" ]] && continue
    if ! command -v "$cmd" &>/dev/null; then
        missing_cmds+=("$cmd")
        missing_pkgs+=("$pkg_name")
    fi
done

if [[ ${#missing_cmds[@]} -eq 0 ]]; then
    success "All dependencies are already installed."
    exit 0
fi

printf "\n${BOLD}Missing dependencies:${RESET}\n"
for i in "${!missing_cmds[@]}"; do
    printf "  ${YELLOW}%-20s${RESET}-> package: %s\n" "${missing_cmds[$i]}" "${missing_pkgs[$i]}"
done
printf "\n"

if [[ $AUTO_YES -eq 0 ]]; then
    printf "Install missing dependencies? (y/N) "
    read -r ok
    [[ "$ok" =~ ^[Yy]$ ]] || { warn "Installation skipped."; exit 0; }
fi

mgr=$(detect_pkg_manager)
if [[ "$AUTO_YES" -eq 1 || "$ok" =~ ^[Yy]$ ]]; then
    case "$mgr" in
        apt)    info "Updating apt package index...";  sudo apt-get update -qq ;;
        dnf)    info "Refreshing dnf metadata...";     sudo dnf check-update -q || true ;;
        pacman) info "Syncing pacman...";              sudo pacman -Sy --noconfirm ;;
        pkg)    info "Updating FreeBSD pkg index...";  sudo pkg update -q ;;
    esac
fi

failed=()
for i in "${!missing_pkgs[@]}"; do
    pkg="${missing_pkgs[$i]}"
    cmd="${missing_cmds[$i]}"
    info "Installing ${pkg} (provides '${cmd}')..."
    if install_pkg "$pkg" &>/dev/null; then
        success "${pkg} installed."
    else
        error "Failed to install ${pkg}."
        failed+=("$pkg")
    fi
done

if command -v python3 &>/dev/null; then
    if ! python3 -m venv --help &>/dev/null; then
        info "Installing python3-venv..."
        # FreeBSD ships venv built into python3; the separate package is Linux-specific
        if [[ "$(uname)" == "FreeBSD" ]]; then
            warn "python3-venv is built into FreeBSD's python3 — skipping."
        else
            install_pkg "python3-venv" &>/dev/null && success "python3-venv installed." \
                || error "Failed to install python3-venv."
        fi
    fi
fi

printf "\n"
if [[ ${#failed[@]} -eq 0 ]]; then
    success "All dependencies installed successfully."
    exit 0
else
    error "The following packages could not be installed: ${failed[*]}"
    exit 1
fi
