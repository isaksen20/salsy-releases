#!/bin/sh
# Salsy dependency fix — Debian 13, AMD64 / ARM64.
# Python libraries and Caddy are supplied by the Salsy Server DEB.
set -u

TITLE='Salsy dependency fix'
PACKAGES='python3 python3-tk libc6 libgcc-s1 libstdc++6 sudo systemd nftables passwd ca-certificates'

finish() {
    code=$1
    if [ -t 0 ]; then
        printf '\nTrykk Enter for å lukke / Press Enter to close. '
        read -r answer || :
    fi
    exit "$code"
}

fail() {
    printf '\nFEIL / ERROR: %s\n' "$1" >&2
    finish 1
}

mode=${1:-}
case "$mode" in
    --help|-h)
        printf '%s\n' "$TITLE" 'Bruk / Usage: sh "Salsy dependency fix.sh" [--check | --install]' \
            'Uten valg: åpner terminal ved behov og installerer systemavhengigheter.' \
            'Default: open a terminal if needed and install system dependencies.' \
            '--check: kontroller uten endringer / check without changes.' \
            '--install: kjør i gjeldende terminal / run in the current terminal.'
        exit 0 ;;
    ''|--check|--install) ;;
    *) printf 'Ukjent valg / Unknown option: %s\n' "$mode" >&2; exit 2 ;;
esac
[ "$#" -le 1 ] || { printf 'For mange argumenter / Too many arguments.\n' >&2; exit 2; }

# A file manager may start an executable without a terminal for sudo's prompt.
if [ -z "$mode" ] && [ ! -t 0 ]; then
    self=$(readlink -f -- "$0") || exit 1
    for terminal in x-terminal-emulator konsole gnome-terminal xfce4-terminal xterm; do
        if command -v "$terminal" >/dev/null 2>&1; then
            case "$terminal" in
                gnome-terminal) exec "$terminal" -- /bin/sh "$self" --install ;;
                xfce4-terminal) exec "$terminal" -x /bin/sh "$self" --install ;;
                *) exec "$terminal" -e /bin/sh "$self" --install ;;
            esac
        fi
    done
    printf 'Åpne en terminal og kjør / Open a terminal and run:\nsh "%s" --install\n' "$self" >&2
    exit 1
fi

printf '\n%s\n====================\n' "$TITLE"
[ -r /etc/os-release ] || fail 'Finner ikke operativsystem / Cannot identify operating system.'
. /etc/os-release
case "${ID:-}:${VERSION_ID:-}" in
    debian:13|raspbian:13) ;;
    *) fail 'Denne filen krever Debian 13 eller Raspberry Pi OS 13. / Debian 13 or Raspberry Pi OS 13 is required.' ;;
esac
for tool in dpkg dpkg-query apt-get; do
    command -v "$tool" >/dev/null 2>&1 || fail "Mangler verktøy / Missing tool: $tool"
done
architecture=$(dpkg --print-architecture) || fail 'Kunne ikke lese arkitektur / Cannot determine architecture.'
case "$architecture" in
    amd64|arm64) ;;
    *) fail 'Salsy-pakkene krever AMD64 eller ARM64 (64-bit). / AMD64 or ARM64 is required.' ;;
esac

package_field() {
    # Select the native architecture on machines with both 32/64-bit libraries.
    dpkg-query -W -f="$2" "$1:$architecture" 2>/dev/null ||
        dpkg-query -W -f="$2" "$1:all" 2>/dev/null
}

check_packages() {
    missing=0
    for package in $PACKAGES; do
        status=$(package_field "$package" '${Status}') || status=''
        if [ "$status" != 'install ok installed' ]; then
            printf 'Mangler / Missing: %s\n' "$package"
            missing=1
        fi
    done
    py_version=$(package_field python3 '${Version}') || py_version=0
    libc_version=$(package_field libc6 '${Version}') || libc_version=0
    if ! dpkg --compare-versions "$py_version" ge 3.13 || ! dpkg --compare-versions "$py_version" lt 3.14; then
        printf 'Python 3.13 kreves / Python 3.13 required (installert / installed: %s).\n' "$py_version"
        missing=1
    fi
    if ! dpkg --compare-versions "$libc_version" ge 2.41; then
        printf 'libc6 >= 2.41 kreves / required (installert / installed: %s).\n' "$libc_version"
        missing=1
    fi
    return "$missing"
}

if [ "$mode" = --check ]; then
    if check_packages; then
        printf 'Alle systemavhengigheter er installert. / All system dependencies are installed.\n'
        exit 0
    fi
    exit 1
fi

printf '%s\n' 'Installerer nødvendige systempakker fra systemets APT-pakkekilder.' \
    'Installs required system packages from your configured APT repositories.' \
    'Administratorpassordet vises ikke når du skriver. / The administrator password is not displayed.'

if [ "$(id -u)" -eq 0 ]; then
    as_root() { "$@"; }
elif command -v sudo >/dev/null 2>&1; then
    sudo -v || fail 'Administratorpålogging ble avbrutt eller avvist. / Administrator authentication cancelled or denied.'
    as_root() { sudo -- "$@"; }
elif command -v su >/dev/null 2>&1; then
    # Minimal Debian installations may not have sudo yet. Ask for root's password.
    printf '%s\n' 'Sudo mangler. Oppgi root-passordet for hver kommando. / Sudo is missing; enter the root password for each command.'
    as_root() {
        case "$1:$2" in
            apt-get:update) su -c 'apt-get update' ;;
            apt-get:install) su -c "apt-get install --yes --no-remove --fix-broken $PACKAGES" ;;
            *) return 1 ;;
        esac
    }
else
    fail 'Verken sudo eller su er tilgjengelig. / Neither sudo nor su is available.'
fi

as_root apt-get update || fail 'Kunne ikke oppdatere pakkelisten. Kontroller internett og APT-kilder. / Could not refresh package lists; check the network and APT sources.'
# --no-remove prevents dependency repair from removing Salsy or other packages.
as_root apt-get install --yes --no-remove --fix-broken $PACKAGES || fail 'APT kunne ikke installere avhengighetene. Se meldingen over. / APT could not install dependencies; see the error above.'
check_packages || fail 'Avhengigheter mangler fortsatt, eller feil versjon er installert. / Dependencies are still missing or an incompatible version is installed.'
printf '\n%s\n' 'Ferdig! Systemavhengighetene til Salsy Server er installert.' \
    'Done! Salsy Server system dependencies are installed.' \
    'Salsy DEB-pakken må også være installert. / The Salsy DEB package must also be installed.'
finish 0
