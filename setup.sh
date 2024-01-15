#!/bin/bash

set -e

# Function to add a GPG key from a URL
add_gpg_key() {
    curl -fsSL "$1" | gpg --dearmor | sudo dd of="$2"
}

# Function to add an APT repository
add_apt_repo() {
    echo "$1" | sudo tee "$2"
}

# Update and install basic tools
sudo apt update
sudo apt install -y vim git curl wget

# Install VSCodium
add_gpg_key "https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" "/usr/share/keyrings/vscodium-archive-keyring.gpg"
add_apt_repo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' "/etc/apt/sources.list.d/vscodium.list"

# Install Spotify
add_gpg_key "https://download.spotify.com/debian/pubkey.gpg" "/etc/apt/trusted.gpg.d/spotify.gpg"
add_apt_repo "deb http://repository.spotify.com stable non-free" "/etc/apt/sources.list.d/spotify.list"

# Install Google Chrome
add_gpg_key "https://dl-ssl.google.com/linux/linux_signing_key.pub" "/etc/apt/trusted.gpg.d/google.gpg"
add_apt_repo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" "/etc/apt/sources.list.d/google-chrome.list"

# Update and install from new repositories
sudo apt update
sudo apt install -y codium spotify-client google-chrome-stable

# Fix Spotify desktop file
sudo sed -i 's/^Exec=spotify %U$/Exec=spotify %U --no-zygote/' /usr/share/spotify/spotify.desktop
sudo sed -i 's/^Exec=spotify %U$/Exec=spotify %U --no-zygote/' /usr/share/applications/spotify.desktop

# Install Zsh
sudo apt install -y zsh

# Install Oh My Zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Add zsh-autosuggestions to .zshrc
sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions)/' "$HOME/.zshrc"

# Install Python packages
sudo apt install -y python3-pip python3-venv

echo "Setup completed successfully."
