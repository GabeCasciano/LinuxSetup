#!/bin/bash

set -euo pipefail

echo "[] Starting setup"

echo "[] Apt update"
sudo apt update

echo "[] Installing apt packages"
sudo apt install -y \
	git \
	curl \
	wget \
	build-essential \
	python3 \
	python3-pip \
	python3-venv \
	neovim \
	tmux \
	htop \
	neofetch \
	npm \
  zsh \
  software-properties-common \
  curl 

echo "[] Downloading Chrome"

cd ~/Downloads/

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb

sudo dpkg -i chrome.deb

echo "[] Downloading regolith"

wget -qO - https://archive.regolith-desktop.com/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://archive.regolith-desktop.com/ubuntu/stable noble v3.2" | \
sudo tee /etc/apt/sources.list.d/regolith.list

sudo apt update

echo "[] APT installing Regolith"

sudo apt install -y rofi regolith-desktop regolith-session-flashback regolith-look-lascaille 

echo "[] Setting up ZSH"
chsh -s "$(which zsh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

echo "Updating plugin list in .zshrc..."
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' ~/.zshrc


echo "[] Downloading Neovim & Nvchad"
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage -O nvim

chmod u+x nvim

sudo rm -rf /usr/local/bin/nvim
sudo mv nvim /usr/local/bin/nvim

npm install -g pyright

rm -rf ~/.config/nvim/

echo "[] NvChad setup is about to begin"
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

echo "[] Cleaning up"
sudo apt autoremove -y

