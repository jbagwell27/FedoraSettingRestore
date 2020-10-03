# Fedora Post Install Script

## What it does

It enables repos, changes config settings, and installs applictaions and Gnome extensions

## What it is for

Fedora 33 is on the horizon, and with Btrfs being the installation default, It won't be viable for me to do an in-place upgrade

## How to use it

Clone the repo, and run [setup.sh](https://github.com/jbagwell27/FedoraSettingRestore/blob/master/setup.sh). You are free to modify and change this however you please.

### Breakdown of the steps

- Enables repos. I have it set to enable and install
  - [RPM Fusion](https://rpmfusion.org/)
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Insync](https://www.insynchq.com/) (insync repo isn't updated for Fedora 33)
  - [Flathub](https://flathub.org)
- Installs some Flatpak apps
  - [Discord](https://flathub.org/apps/details/com.discordapp.Discord)
  - [Color Picker](https://flathub.org/apps/details/nl.hjdskes.gcolor3)
  - [Telegram](https://flathub.org/apps/details/org.telegram.desktop)
  - [Go For It!](https://flathub.org/apps/details/de.manuel_kehl.go-for-it)
- Installs some native programs
  - Vim
  - Geary
  - VirtualBox
  - Filezilla
  - and more
- Adds fstab entries for personal NFS shares.
- Disables Wayland and sets Xorg as default display server
- Pulls git repos and installs the following Gnome Extensions  
  - [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/)  
  - [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
  - [Lock Keys](https://extensions.gnome.org/extension/36/lock-keys/)
  - [Panel OSD](https://extensions.gnome.org/extension/708/panel-osd/)
  - [Todo.txt](https://extensions.gnome.org/extension/570/todotxt/)

I will continue to update the script as I add new applications and configurations to my workflow.
