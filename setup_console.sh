#!/bin/bash

# Farben für die Ausgabe
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starte die Installation deiner coolen Konsole...${NC}"

# 1. System Update
echo -e "${GREEN}🔄 Aktualisiere Paketlisten...${NC}"
sudo apt update

# 2. Fish Shell installieren
echo -e "${GREEN}🐟 Installiere Fish Shell...${NC}"
sudo apt install -y fish

# 3. Oh My Posh installieren (direkt nach /usr/local/bin)
echo -e "${GREEN}✨ Installiere Oh My Posh...${NC}"
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin

# 4. Verzeichnisse erstellen
echo -e "${GREEN}📂 Erstelle Konfigurationsordner...${NC}"
mkdir -p ~/.config/fish
mkdir -p ~/.config/oh-my-posh

# 5. Konfigurationsdateien kopieren
# Wir nehmen an, das Skript wird im Repo-Ordner ausgeführt
echo -e "${GREEN}📝 Kopiere Konfigurationsdateien...${NC}"

if [ -f "config.fish" ]; then
    cp config.fish ~/.config/fish/config.fish
    echo "✅ config.fish kopiert."
else
    echo "⚠️  config.fish nicht im aktuellen Verzeichnis gefunden!"
fi

if [ -f "customMontys.omp.json" ]; then
    cp customMontys.omp.json ~/.config/oh-my-posh/customMontys.omp.json
    echo "✅ customMontys.omp.json kopiert."
else
    echo "⚠️  customMontys.omp.json nicht im aktuellen Verzeichnis gefunden!"
fi

# 6. Fish als Standardshell setzen
echo -e "${GREEN}🐚 Ändere Standard-Shell zu Fish...${NC}"
sudo chsh -s /usr/bin/fish $USER

echo -e "${BLUE}--------------------------------------------------${NC}"
echo -e "${BLUE}✅ Installation abgeschlossen!${NC}"
echo -e "Bitte starte dein Terminal (oder WSL) neu."
echo -e "WICHTIG unter WSL: Stelle sicher, dass du einen ${GREEN}Nerd Font${NC} in den Windows Terminal Einstellungen gewählt hast!"
echo -e "${BLUE}--------------------------------------------------${NC}"
