# OpenWrt-Wi-Fi-Attack-Tool
# Wireless Network Pentest Script for OpenWrt

This repository contains a robust bash script designed for wireless network penetration testing on OpenWrt-compatible devices. The script provides an all-in-one solution for scanning, selecting, and attacking wireless networks, utilizing monitor mode on supported interfaces.

---

## Features
- **Automatic Interface Selection**: Lists available interfaces and sets the chosen one to monitor mode.
- **Network Scanning**: Scans for nearby wireless networks, saving details (BSSID, channel, encryption type) to a CSV file.
- **Target Selection**: Choose a target from the scanned networks for further analysis.
- **Attack Modes**: Select attack type and execute it on the selected target.
- **Monitor Mode Reset**: Automatically returns interfaces to managed mode after completion, ensuring no disruption to the network.

---

## Requirements
- **OpenWrt-Compatible Device**: Ensure that your router supports OpenWrt and can enable monitor mode on wireless interfaces.
- **Necessary Packages**: The following packages are required on OpenWrt:
  - `airmon-ng`
  - `iw`
  - `aircrack-ng`

Install packages using:
```bash
opkg update && opkg install <package_name>
Installation
Clone this repository to your OpenWrt device:


git clone https://github.com/<your-username>/Wireless-Network-Pentest-Script-for-OpenWrt.git
cd Wireless-Network-Pentest-Script-for-OpenWrt
Make the script executable:


chmod +x new.sh
Usage
Run the Script:


./new.sh
Select the Interface: Choose an interface from the listed options to set in monitor mode.

Scan Networks: The script initiates a network scan and saves results in a CSV file.

Choose Target: After scanning, pick a target BSSID from the CSV.

Select Attack Mode: Follow prompts to execute specific attacks on the target.

Example Output

Available network interfaces:
1) phy0-ap0
2) phy1-ap0
Select the interface name (e.g., phy0-ap0): phy1-ap0
Setting phy1-ap0 to monitor mode...
Monitor mode enabled on mon0.
Scanning for networks on mon0...
Network scanning completed. BSSIDs saved to networks-<timestamp>.csv.
Choose a target from networks-<timestamp>.csv for the attack.
Enter BSSID of target:
Installation
Clone this repository to your OpenWrt device:

bash
Copy code
git clone https://github.com/<your-username>/Wireless-Network-Pentest-Script-for-OpenWrt.git
cd Wireless-Network-Pentest-Script-for-OpenWrt
Make the script executable:

bash
Copy code
chmod +x new.sh
Usage
Run the Script:

bash
Copy code
./new.sh
Select the Interface: Choose an interface from the listed options to set in monitor mode.

Scan Networks: The script initiates a network scan and saves results in a CSV file.

Choose Target: After scanning, pick a target BSSID from the CSV.

Select Attack Mode: Follow prompts to execute specific attacks on the target.

Example Output
plaintext
Copy code
Available network interfaces:
1) phy0-ap0
2) phy1-ap0
Select the interface name (e.g., phy0-ap0): phy1-ap0
Setting phy1-ap0 to monitor mode...
Monitor mode enabled on mon0.
Scanning for networks on mon0...
Network scanning completed. BSSIDs saved to networks-<timestamp>.csv.
Choose a target from networks-<timestamp>.csv for the attack.
Enter BSSID of target:
Contributing
Pull requests for bug fixes, improvements, or additional features are welcome. For major changes, please open an issue first to discuss your ideas.

License
This project is licensed under the MIT License - see the LICENSE file for details.

vbnet
Copy code

Simply copy and paste this markdown into your repository’s README.md file, and customize it as needed! Let me know if you want further help with sections or formatting.











