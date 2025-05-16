#!/usr/bin/env bash
set -euo pipefail

echo "[*] Installing Regolith Desktop..."

# Ensure prerequisites
sudo apt update -qq
sudo apt install -y -qq software-properties-common curl

# Update and install Regolith
sudo apt update -qq
sudo apt install -y -qq rofi regolith-desktop regolith-session-flashback regolith-look-lascaille

echo "[✓] Regolith installed. Log out and select 'Regolith' from the login screen."

