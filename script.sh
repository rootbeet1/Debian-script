#!/bin/bash -e


#Post-Installation Skript for Debian(bookworm)/stable/testing------------------------------------------------------------------------------------
# ASCII Beginning--------------------------------------------------------------------------------------------------------------------------------
echo -e 
cat << "EOF"
       __          __       __                   
      |  \        |  \     |  \                  
  ____| ▓▓ ______ | ▓▓____  \▓▓ ______  _______  
 /      ▓▓/      \| ▓▓    \|  \|      \|       \ 
|  ▓▓▓▓▓▓▓  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\ ▓▓ \▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\
| ▓▓  | ▓▓ ▓▓    ▓▓ ▓▓  | ▓▓ ▓▓/      ▓▓ ▓▓  | ▓▓
| ▓▓__| ▓▓ ▓▓▓▓▓▓▓▓ ▓▓__/ ▓▓ ▓▓  ▓▓▓▓▓▓▓ ▓▓  | ▓▓
 \▓▓    ▓▓\▓▓     \ ▓▓    ▓▓ ▓▓\▓▓    ▓▓ ▓▓  | ▓▓
  \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓\▓▓▓▓▓▓▓ \▓▓ \▓▓▓▓▓▓▓\▓▓   \▓▓                                                 
                                                    
                                                    	BY github.com/rootbeet1                                  
EOF
sleep 2


# Update packages list and update system---------------------------------------------------------------------------------------------------
apt-get update
apt-get upgrade -y


# Install nala-----------------------------------------------------------------------------------------------------------------------------
apt-get install nala -y
nala fetch 
nala update


#Add-repo-----------------------------------------------------------------------------------------------------------------------------------
while true; do
    read -p "Do you want Debian testing (not recommended for beginners)?" yn
    case $yn in
        [Yy]* ) cp ./sources2.list /etc/apt/sources.list;break;;
        [Nn]* ) cp ./sources.list /etc/apt/; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

nala upgrade -y

#installing desktop enviroment-------------------------------------------------------------------------------------------------------------
nala install gnome-core qgnomeplatform-qt5 -y


#update------------------------------------------------------------------------------------------------------------------------------------
nala update


#installing essential programms------------------------------------------------------------------------------------------------------------
#system utilities:
nala install gparted kitty net-tools curl wget cpu-x git htop gnome-console lm-sensors plymouth-themes ufw nmap -y
nala update

#Productivity & Office Suites:
nala install gimp libreoffice-gtk3 texmaker xournalpp keepassxc pdfarranger cherrytree baobab nextcloud-desktop bleachbit -y
nala update

#Multimedia:
nala install vlc onionshare -y
nala update

#Theming:
nala papirus-icon-theme gnome-shell-extension-dashtodock gnome-shell-extension-appindicator gnome-tweaks gnome-power-manager -y
nala update

#Browsers:
nala install firefox-esr torbrowser-launcher -y
nala update

#programming-utilities:
nala install python3 python3-pip -y
nala update

      
#installing LibreWolf----------------------------------------------------------------------------------------------------------------------
nala update && nala install wget gnupg lsb-release apt-transport-https ca-certificates -y

distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)

wget -O- https://deb.librewolf.net/keyring.gpg | gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
 tee /etc/apt/sources.list.d/librewolf.sources << EOF > /dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

nala update

nala install librewolf -y


#installing VSCodium-----------------------------------------------------------------------------------------------------------------------
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
    
nala update &&  nala install codium -y
echo -e


#Clean-------------------------------------------------------------------------------------------------------------------------------------
nala remove fonts-noto-extra gnome-contacts yelp -y

#Option of installing Flatpak--------------------------------------------------------------------------------------------------------------
while true; do
    read -p "Do you want to install Flatpak (recommended for beginners)? (yes/no): " yn
    case $yn in
        [Yy]* )
            nala update
            nala install flatpak
            nala install gnome-software-plugin-flatpak
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
            echo "Flatpak installed successfully. Flathub repository added."
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done

#Option of deleting gnome-software---------------------------------------------------------------------------------------------------------
while true; do
    read -p "Do you wish to remove the graphical Software Manager (better performance without gnome-software, not recommended for beginners)? (yes/no): " yn
    case $yn in
        [Yy]* )
            nala remove gnome-software* -y
            echo "GNOME Software Manager has been removed."
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done

nala clean
nala autoremove -y


#Option of installing Flatpak--------------------------------------------------------------------------------------------------------------
while true; do
    read -p "Do you want to install Flatpak (recommended for beginners)? (yes/no): " yn
    case $yn in
        [Yy]* )
            nala update
            nala install flatpak
            nala install gnome-software-plugin-flatpak
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
            echo "Flatpak installed successfully. Flathub repository added."
            break
            ;;
        [Nn]* )
            break
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done

#ASCII-ENDING------------------------------------------------------------------------------------------------------------------------------
echo "---------------------------------------------------------------------------------------------------------------------------------"
echo -e 
echo -e 
echo "WELCOME HOME, FINALLY LINUX!!!!!!!!!!!!!!!!!!"
echo -e 
echo -e 
echo "------------------------------------------------------------------------------------------------------------------------------------"
sleep 1
echo -e

exit 0







