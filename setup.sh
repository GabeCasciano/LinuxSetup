#!/bin/bash

set -e
set -u
set -o pipefail

echo "Setting setup"
sudo apt update

echo "Installing git"
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
	neofetch 

echo "Cleaning up"
sudo apt autoremove -y

