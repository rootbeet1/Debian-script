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
nala update


#Add-repo-----------------------------------------------------------------------------------------------------------------------------------
while true; do
    read -p "Do you want Debian testing (not recommended for beginners)? (y/n)" yn
    case $yn in
        [Yy]* ) 
        echo "Debian testing"
        cp ./sources2.list /etc/apt/sources.list
        break
        ;;
        [Nn]* )
        echo "Debian stable" 
        cp ./sources.list /etc/apt/
        break
        ;;
        * ) 
        echo "Please answer yes or no."
        ;;
    esac
done

nala upgrade -y

#update------------------------------------------------------------------------------------------------------------------------------------
nala update

while true; do
    read -p "Which desktop enviroment do you want (k => kde plasma) or (g => gnome)? (k/g)" kg
    case $kg in
        [Kk]* ) 
        echo "kde will be installed..."
        
        #installing desktop enviroment
        nala install plasma-desktop sddm -y
        
        #installing essential programms:
        #system utilities:
        nala install gparted gnome-disk-utility net-tools curl wget cpu-x git htop konsole lm-sensors ufw nmap kde-spectacle ark dolphin -y
        nala update
        
        #Browsers:
        nala install firefox-esr torbrowser-launcher -y
        nala update

        #Multimedia:
        nala install vlc okular -y
        nala update

        #Productivity & Office Suites:
        nala install gimp libreoffice-gtk3 libreoffice texmaker xournalpp keepassxc pdfarranger nextcloud-desktop kate -y
        nala update
        
        #Theming 
        mkdir -p ~/Theming
        git clone https://github.com/jacksaur/Gorgeous-GRUB ~/Theming

        #programming-utilities:
        nala install python3 python3-pip -y
        nala update
        
        #Option of installing Flatpak:
        while true; do
            read -p "Do you want to install Flatpak (recommended for beginners)? (y/n): " yn
            case $yn in
                [Yy]* )
                    nala update
                    nala install flatpak
                    nala install plasma-discover-plugin-flatpak
                    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
                    echo "Flatpak installed successfully. Flathub repository added."
                    break
                    ;;
                [Nn]* )
                    echo "Flatpak won't be installed"
                    break
                    ;;
                * )
                    echo "Please answer yes or no."
                    ;;
            esac
        done

        #Clean
        nala remove palsma-discover packagekit -y
        nala clean
        nala autoremove -y

        break
        ;;
        [Gg]* )
        echo "gnome will be installed..." 
        
        #installing desktop enviroment
        nala install gnome-core qgnomeplatform-qt5 -y

        #installing essential programms:
        ##system utilities:
        nala install gparted net-tools curl wget cpu-x git htop gnome-console lm-sensors plymouth-themes ufw nmap -y
        nala update

        #Browsers:
        nala install firefox-esr torbrowser-launcher -y
        nala update
        
        #Multimedia:
        nala install vlc -y
        nala update

        #Productivity & Office Suites:
        nala install gimp libreoffice libreoffice-gtk3 texmaker xournalpp keepassxc pdfarranger nextcloud-desktop bleachbit -y
        nala update

        #Theming:
        nala papirus-icon-theme gnome-shell-extension-dashtodock gnome-shell-extension-appindicator gnome-tweaks gnome-power-manager -y
        nala update
        
        mkdir -p ~/Theming
        git clone https://github.com/jacksaur/Gorgeous-GRUB ~/Theming
        
        #programming-utilities:
        nala install python3 python3-pip -y
        nala update
        
        #Option of installing Flatpak:
        while true; do
            read -p "Do you want to install Flatpak (recommended for beginners)? (y/n): " yn
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
                    echo "Flatpak won't be installed"
                    break
                    ;;
                * )
                    echo "Please answer yes or no."
                    ;;
            esac
        done
        
        #Clean
        nala remove fonts-noto-extra gnome-contacts yelp -y

        #Option of deleting gnome-software---------------------------------------------------------------------------------------------------------
        while true; do
            read -p "Do you wish to remove the graphical Software Manager (not recommended for beginners)? (y/n): " yn
            case $yn in
                [Yy]* )
                    nala remove gnome-software* -y
                    echo "GNOME Software Manager has been removed."
                    break
                    ;;
                [Nn]* )
                    echo "grpahical Software manager won't be removed"
                    break
                    ;;
                * )
                    echo "Please answer yes or no."
                    ;;
            esac
        done

        nala clean
        nala autoremove -y

        break
        ;;
        * ) 
        echo "Please answer k (for kde) or g (for gnome)."
        ;;
    esac
done
      
#installing LibreWolf----------------------------------------------------------------------------------------------------------------------
nala update && nala install extrepo -y

extrepo enable librewolf

nala update && nala install librewolf -y


#installing VSCodium-----------------------------------------------------------------------------------------------------------------------
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
    
nala update &&  nala install codium -y
echo -e

#ASCII-ENDING------------------------------------------------------------------------------------------------------------------------------
echo "Installation finished!!!"
sleep 1

exit 0







