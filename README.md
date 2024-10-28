# Wireless Network Pentest Tool for OpenWrt

This repository contains a robust bash script designed for wireless network penetration testing on OpenWrt-compatible devices. The script provides an all-in-one solution for scanning, collecting, and attacking wireless networks, utilizing monitor mode on supported interfaces.

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

## Install packages using:

- opkg update && opkg install airmon-ng iw aircrack-ng
- Installation
-Clone this repository to your OpenWrt device:
- git clone https://github.com/nulloneinfo/Wireless-Network-Pentest-Script-for-OpenWrt.git
- cd Wireless-Network-Pentest-Script-for-OpenWrt

- Make the script executable:
- chmod +x Wifi-Wrt.sh
## Usage
- Run the Script:
- ./Wifi-Wrt.sh


- Select the Interface: Choose an interface from the listed options to set in monitor mode.

- Scan Networks: The script initiates a network scan and saves results in a CSV file.

- Choose Target: After scanning, pick a target BSSID from the CSV.

- Select Attack Mode: Follow prompts to execute specific attacks on the target.


## Contributing
- Pull requests for bug fixes, improvements, or additional features are welcome. For major changes, please open an issue first to discuss your ideas.

## License
- This project is licensed under the MIT License - see the LICENSE file for details.



Simply copy and paste this markdown into your repository’s README.md file, and customize it as needed! Let me know if you want further help with sections or formatting.
