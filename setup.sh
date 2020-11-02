# Author: Joshua Bagwell
# I made this so that I could make a fresh install simpler for me. If you want it, you can have it.
# Feel free to use, or modify this script and it's contents however you please.

# Install Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

# Install Non-Free RPM Fusion Repo
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Install VSCode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Enable Flatpak repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable Insync Repo
sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
sudo sh -c 'echo -e "[insync]\nname=insync repo\nbaseurl=http://yum.insync.io/fedora/\$releasever/\ngpgcheck=1\ngpgkey=https://d2t3ff60b2tol4cloudfront.net/repomd.xml.key\nenabled=1\nmetadata_expire=120m" > /etc/yum.repos.d/insync.repo'

# Update newly installed repos
sudo dnf update -y

# Install dependencies
sudo dnf install make redhat-rpm-config gnome-tweaks pkg-config git zip gnome-common autoconf automake gnome-tweak-tool gettext-devel glib -y

# Install Flatpak Software
flatpak install flathub com.discordapp.Discord org.telegram.desktop nl.hjdskes.gcolor3 -y


# Install Applications
sudo dnf install code vim geary VirtualBox filezilla gparted gimp wine snapd epiphany insync bpytop gstreamer1-plugin-openh264 gstreamer1-libav -y

# Update fstab
sudo mkdir /media/share
sudo mkdir /media/plex
echo -e '192.168.1.4:/mnt/mainpool/share\t/media/share\tnfs\trw\t0\t0' | sudo tee -a /etc/fstab
echo -e '192.168.1.4:/mnt/mainpool/plex\t/media/plex\tnfs\trw\t0\t0' | sudo tee -a /etc/fstab

# Update Hosts
echo -e '192.168.1.4\tfreenas.local' | sudo tee -a /etc/hosts
echo -e '192.168.1.6\tplex.local' | sudo tee -a /etc/hosts
echo -e '192.168.1.8\ttransmission.local' | sudo tee -a /etc/hosts
echo -e '192.168.1.25\tpiarouter.local' | sudo tee -a /etc/hosts

# Extra configurations

# Add user to vboxusers group for virtualbox configuration
sudo usermod -a -G vboxusers $USER
# Switch to xorg from Wayland
sudo cp /etc/gdm/custom.conf /etc/gdm/custom.conf.bak
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm/custom.conf
sudo sed -i '/WaylandEnable=false/a DefaultSession=gnome-xorg.desktop' /etc/gdm/custom.conf


# Install Gnome extensions
mkdir ~/.local/share/gnome-shell/extensions/

# Dash to panel
cd ~ && git clone https://github.com/home-sweet-gnome/dash-to-panel.git
cd dash-to-panel
make install

# Todo.txt Extension
cd ~ && git clone https://gitlab.com/bartl/todo-txt-gnome-shell-extension.git
cp -avr todo-txt-gnome-shell-extension/ ~/.local/share/gnome-shell/extensions/todo.txt@bart.libert.gmail.com/
cd ~/.local/share/gnome-shell/extensions/todo.txt@bart.libert.gmail.com/
pip install -r requirements.txt
make install

# Notification Center
cd ~ && git clone https://github.com/Selenium-H/Notification-Center.git
cd Notification-Center
bash INSTALL.sh

# Lock Keys
cd ~ && git clone https://github.com/kazysmaster/gnome-shell-extension-lockkeys.git
cp -r gnome-shell-extension-lockkeys/lockkeys@vaina.lt/ ~/.local/share/gnome-shell/extensions/lockkeys@vaina.lt

# App Indicator
cd ~ && git clone https://github.com/ubuntu/gnome-shell-extension-appindicator.git
cp -r gnome-shell-extension-appindicator/ ~/.local/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com

# Clean up added repos
rm -rf ~/dash-to-panel/
rm -rf ~/todo-txt-gnome-shell-extension/
rm -rf ~/Notification-Center/
rm -rf ~/gnome-shell-extension-lockkeys/
rm -rf ~/gnome-shell-extension-appindicator/

echo -e 'Update complete. Please restart the machine to refresh GDM and enable snappak installs.'
