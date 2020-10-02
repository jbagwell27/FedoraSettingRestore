# Author: Joshua Bagwell
# I made this so that I could make a fresh install simpler for me. If you want it, you can have it.
# Feel free to use, or modify this script and it's contents however you please.

# Install Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

# Install Non-Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Update newly installed repos
sudo dnf update

# Install Make
sudo dnf install make -y

# Enable Flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpak Software
flatpak install flathub de.manuel_kehl.go-for-it com.discordapp.Discord -y


# Install Gnome extensions
# Dash to panel
git clone https://github.com/home-sweet-gnome/dash-to-panel.git && cd dast-to-panel
make install

