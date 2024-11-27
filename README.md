---
# Debian-script
Debian customization from rootbeet1!
The script automates essential system updates, software installations, and configurations, aimed at tailoring the Debian environment to personal preferences.
---
## **To install**
1. **Start with a minimal Debian installation**:
   - During the Debian installation process, select the **"Debian Installer"** option to customize your setup.
   - In the software selection screen, only choose **"System Utilities"** to keep the installation minimal and avoid unnecessary pre-installed software.

2. **Download and run the script**:
   - Install git:
     ```bash
     sudo apt install git
     ```
   - Clone this repository:
     ```bash
     git clone https://github.com/rootbeet1/Debian-script
     ```
   - Navigate to the script folder:
     ```bash
     cd Debian-script
     ```
   - Execute the script with administrative privileges:
     ```bash
     sudo bash script.sh
     ```

---

## **Features**

### **System Updates**
Ensures the system is up-to-date by updating the package list and performing system upgrades.

### **Nala Configuration**
Utilizes the Nala package manager to fetch, update, and manage essential system components.

### **Repository Management**
Provides options to switch between Debian testing and stable repositories, with careful consideration for user preference and experience level.

### **Desktop Environment Installation**
Offers seamless installation of desktop environments, including:
- **KDE Plasma**: Lightweight, customizable, and feature-rich. Ideal for users preferring a polished and efficient environment.
- **GNOME with QGNOME Platform**: A modern and streamlined desktop experience, with additional customization options.

### **Essential Software Installation**
Installs a curated set of essential programs, including:
- **System Utilities**: Tools for monitoring, managing disks, network utilities, and more.
- **Browsers**: Firefox ESR and Tor Browser for secure and private browsing.
- **Multimedia**: VLC, Okular, and other media-related utilities.
- **Office & Productivity Tools**: LibreOffice, GIMP, Nextcloud, Texmaker, and more.
- **Development Tools**: Python3, pip, and additional programming utilities.
- **Flatpak Support**: Optional installation for managing applications via Flatpak.

### **LibreWolf & VSCodium Installation**
Fetches and installs:
- **LibreWolf**: A privacy-focused fork of Firefox.
- **VSCodium**: An open-source alternative to Visual Studio Code.

### **System Cleanup**
Removes unnecessary packages, streamlines system resources, and offers the option to remove the graphical software manager for enhanced system performance.

---

## **How to Customize the Installation**
- **System Utilities Only**: If you only want system utilities, select **"System Utilities"** during the Debian installer process and let the script handle the rest.
- During script execution, you will be prompted to choose:
  - **Desktop Environment**: KDE Plasma or GNOME.
  - **Optional Features**: Flatpak and other extras can be skipped if desired.

This modular approach allows you to install only what you need.

---

## **Disclaimer**
Please use this script with caution, ensuring compatibility with your system and understanding the implications of the modifications it makes. It is recommended for users familiar with Debian-based systems.

---
