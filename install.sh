#!/bin/bash
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}====================================================${NC}"
echo -e "${CYAN}🚀  Starting the Linux Terminal Setup  🚀${NC}"
echo -e "${CYAN}====================================================${NC}"
echo ""

# Detect WSL vs Native Linux
IS_WSL=0
if grep -qi microsoft /proc/version >/dev/null 2>&1; then
    IS_WSL=1
    echo -e "${BLUE}[INFO]${NC} Detected Environment: ${YELLOW}Windows Subsystem for Linux (WSL)${NC}"
else
    echo -e "${BLUE}[INFO]${NC} Detected Environment: ${YELLOW}Native Linux${NC}"
fi

# 1. System Update & Dependencies
echo -e "\n${GREEN}[1/6] 🔄 Updating package lists and installing dependencies...${NC}"
sudo apt update
sudo apt install -y curl wget unzip fontconfig

# 2. Install Fish Shell
echo -e "\n${GREEN}[2/6] 🐟 Installing Fish Shell...${NC}"
sudo apt install -y fish

# 3. Install Oh My Posh
echo -e "\n${GREEN}[3/6] ✨ Installing Oh My Posh...${NC}"
if ! command -v oh-my-posh &> /dev/null; then
    curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin
else
    echo -e "Oh My Posh is already installed. Skipping."
fi

# 4. Handle Fonts
echo -e "\n${GREEN}[4/6] 🔤 Setting up Nerd Fonts...${NC}"
if [ $IS_WSL -eq 1 ]; then
    echo -e "⏭️  ${YELLOW}Skipping automatic font installation for WSL.${NC}"
    echo -e "   Please download the ${CYAN}FiraCode Nerd Font${NC} on Windows and set it in your Windows Terminal profile!"
else
    FONT_DIR="$HOME/.local/share/fonts"
    if fc-list | grep -qi "FiraCode Nerd Font"; then
        echo -e "✅ FiraCode Nerd Font is already installed."
    else
        echo -e "📥 Downloading and installing FiraCode Nerd Font..."
        mkdir -p "$FONT_DIR"
        wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip
        unzip -q -o /tmp/FiraCode.zip -d "$FONT_DIR"
        fc-cache -f -v >/dev/null
        rm /tmp/FiraCode.zip
        echo -e "✅ Font installed successfully!"
        echo -e "⚠️  ${YELLOW}Make sure to set your terminal application (e.g. GNOME Terminal) font to 'FiraCode Nerd Font Mono'.${NC}"
    fi
fi

# 5. Copy Configurations
echo -e "\n${GREEN}[5/6] 📝 Setting up configuration files...${NC}"
mkdir -p ~/.config/fish
mkdir -p ~/.poshthemes

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$REPO_DIR/config.fish" ]; then
    cp "$REPO_DIR/config.fish" ~/.config/fish/config.fish
    echo -e "✅ Copied ${CYAN}config.fish${NC}"
else
    echo -e "⚠️  ${RED}config.fish not found in $REPO_DIR!${NC}"
fi

if [ -f "$REPO_DIR/customMontys.omp.json" ]; then
    cp "$REPO_DIR/customMontys.omp.json" ~/.poshthemes/customMontys.omp.json
    echo -e "✅ Copied ${CYAN}customMontys.omp.json${NC}"
else
    echo -e "⚠️  ${RED}customMontys.omp.json not found in $REPO_DIR!${NC}"
fi

# 6. Change Default Shell
echo -e "\n${GREEN}[6/6] 🐚 Changing default shell to Fish...${NC}"
if [ "$SHELL" != "/usr/bin/fish" ] && [ "$SHELL" != "/bin/fish" ]; then
    sudo chsh -s /usr/bin/fish "$USER"
    echo -e "✅ Default shell changed to fish."
else
    echo -e "✅ Fish is already your default shell."
fi

echo -e "\n${CYAN}====================================================${NC}"
echo -e "${GREEN}🎉 Installation Complete! 🎉${NC}"
echo -e "${CYAN}====================================================${NC}"
echo -e "Please ${YELLOW}restart your terminal${NC} or log out and back in for all changes to take effect."
if [ $IS_WSL -eq 1 ]; then
    echo -e "WICHTIG unter WSL: Stelle sicher, dass du einen ${GREEN}Nerd Font${NC} in den Windows Terminal Einstellungen gewählt hast!"
fi
echo -e "Enjoy your new beautiful terminal! 🚀"
