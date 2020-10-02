# Author: Joshua Bagwell
# I made this so that I could make a fresh install simpler for me. If you want it, you can have it.
# Feel free to use, or modify this script and it's contents however you please.

# Clone PrivateFiles repo
git clone https://github.com/jbagwell27/PrivateFiles.git

# Install Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

# Install Non-Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install VSCode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Enable Flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update newly installed repos
sudo dnf update

# Install dependencies
sudo dnf install make redhat-rpm-config -y

# Update fstab
# sudo mkdir /media/share
# sudo mkdir /media/plex
# echo -e '192.168.1.4:/mnt/mainpool/share\t/media/share\tnfs\trw\t0t\0' | sudo tee -a /etc/fstab
# echo -e '192.168.1.4:/mnt/mainpool/plex\t/media/plex\tnfs\trw\t0\t0' | sudo tee -a /etc/fstab

# Install Flatpak Software
flatpak install flathub de.manuel_kehl.go-for-it com.discordapp.Discord -y

# Install Applications
sudo dnf install code vim geary VirtualBox gnome-tweaks 

# Install Gnome extensions

# Dash to panel
git clone https://github.com/home-sweet-gnome/dash-to-panel.git && cd dast-to-panel
make install

# Todo.txt Shell Extension
git clone https://gitlab.com/bartl/todo-txt-gnome-shell-extension.git
mkdir ~/.local/share/gnome-shell/extensions
cp -avr todo-txt-gnome-shell-extension/ ~/.local/share/gnome-shell/extensions/todo.txt@bart.libert.gmail.com
cd ~/.local/share/gnome-shell/extensions/todo.txt@bart.libert.gmail.com && pip install -r requirements.txt
make install
cd ~

# Copy Firefox preferences
mv ~/.mozilla/firefox ~/.mozilla/firefox.bak
cp -r PrivateFiles/firefox ~/.mozilla/firefox