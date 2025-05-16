#!/usr/bin/env bash
set -euo pipefail

echo "[*] Installing Regolith Desktop..."

echo " Adding PPA"
wget -qO - https://archive.regolith-desktop.com/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://archive.regolith-desktop.com/ubuntu/stable noble v3.2" | \
sudo tee /etc/apt/sources.list.d/regolith.list

# Ensure prerequisites
sudo apt update -qq
sudo apt install -y -qq software-properties-common curl

# Update and install Regolith
sudo apt update -qq
sudo apt install -y -qq rofi regolith-desktop regolith-session-flashback regolith-look-lascaille

echo "[✓] Regolith installed. Log out and select 'Regolith' from the login screen."

