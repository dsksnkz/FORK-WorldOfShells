#!/bin/bash
# World of Shells - Installer
# Usage: bash install.sh

set -e

APP_NAME="WorldOfShells"
APP_DIR="$HOME/.config/quickshell/$APP_NAME"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== World of Shells - Installation ==="
echo ""

# Check dependencies
echo "Vérification des dépendances..."
for dep in qs quickshell; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        echo "ERREUR: $dep n'est pas installé."
        echo "Installez Quickshell: https://quickshell.org"
        exit 1
    fi
done
echo "Quickshell: OK"

# Check Hyprland
if ! command -v hyprctl >/dev/null 2>&1; then
    echo "ATTENTION: hyprctl non trouvé. Hyprland est requis."
fi

# Install app files
echo "Installation des fichiers..."
mkdir -p "$APP_DIR"
cp -r "$SCRIPT_DIR"/* "$APP_DIR/"
chmod +x "$APP_DIR"/*.sh

# Create .desktop entry
mkdir -p "$HOME/.local/share/applications"
cat > "$HOME/.local/share/applications/world-of-shells.desktop" <<EOF
[Desktop Entry]
Name=World of Shells
Comment=Showcase and try different Hyprland shells
Exec=qs -c WorldOfShells
Icon=$APP_DIR/assets/logo.png
Type=Application
Categories=Utility;
Terminal=false
StartupNotify=true
EOF

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo ""
echo "=== Installation terminée ==="
echo "Lancez l'app avec: qs -c WorldOfShells"
echo "Ou depuis le lanceur d'applications: World of Shells"
echo ""
echo "Note: Pour les shells nécessitant une installation (end-4, DMS),"
echo "suivez les instructions affichées dans l'application."