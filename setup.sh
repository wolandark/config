#!/bin/bash

sudo apt update
sudo apt install vim git curl wget -y

# install vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install codium -y

# install spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update && sudo apt install spotify-client -y

# fix spotify

sudo sed -i 's/^Exec=spotify %U$/Exec=spotify %U --no-zygote/' /usr/share/spotify/spotify.desktop
sudo sed -i 's/^Exec=spotify %U$/Exec=spotify %U --no-zygote/' /usr/share/applications/spotify.desktop

# install google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"

sudo apt update && sudo apt install google-chrome-stable -y

# install zsh
sudo apt install zsh -y

# install ohmyzsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# add zsh-autosuggestions to .zshrc
sudo sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# install python packages
sudo apt install python3-pip python3-venv -y
