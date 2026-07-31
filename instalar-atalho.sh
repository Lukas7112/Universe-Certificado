#!/bin/bash
APP_DIR="$HOME/.local/share/universe-cert"
DESKTOP_FILE="$HOME/Desktop/universe-cert.desktop"
ICON_DEST="$HOME/.local/share/icons/universe-cert.png"

echo "→ Copiando app para $APP_DIR ..."
mkdir -p "$APP_DIR"
cp -r "$(dirname "$0")/." "$APP_DIR/"

echo "→ Instalando ícone ..."
mkdir -p "$HOME/.local/share/icons"
cp "$(dirname "$0")/assets/images/icon.png" "$ICON_DEST"

echo "→ Criando atalho na área de trabalho ..."
cat > "$DESKTOP_FILE" << DESK
[Desktop Entry]
Version=1.0
Type=Application
Name=Universe Certificados
Comment=Gerador de Certificados v0.0.8.7 beta
Exec=bash -c "cd $APP_DIR && npx electron ."
Icon=$ICON_DEST
Terminal=false
Categories=Office;Education;
DESK

chmod +x "$DESKTOP_FILE"
gio set "$DESKTOP_FILE" metadata::trusted true 2>/dev/null

echo "✓ Pronto! Ícone criado na área de trabalho."
