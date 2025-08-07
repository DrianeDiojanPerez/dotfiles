#!/bin/bash

# VPN Waybar Module Script
# Save as ~/.config/waybar/scripts/vpn.sh

check_vpn_status() {
    # Check if vpnc process is running
    if pgrep -x "vpnc" > /dev/null; then
        return 0  # Connected
    else
        return 1  # Disconnected
    fi
}

get_vpn_info() {
    if check_vpn_status; then
        # Get VPN interface info
        local interface=$(ip route | grep "tun" | head -n1 | awk '{print $3}')
        local ip=$(ip addr show $interface 2>/dev/null | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
        echo "{\"text\":\"󰖂 VPN\",\"tooltip\":\"Connected: $ip\",\"class\":\"connected\"}"
    else
        echo "{\"text\":\"󰖂 VPN\",\"tooltip\":\"Disconnected - Click to connect\",\"class\":\"disconnected\"}"
    fi
}

toggle_vpn() {
    if check_vpn_status; then
        # Disconnect
        pkexec vpnc-disconnect
        notify-send "VPN" "Disconnected" -i network-vpn-symbolic
    else
        # Connect
        pkexec vpnc --enable-weak-encryption
        if check_vpn_status; then
            notify-send "VPN" "Connected successfully" -i network-vpn-symbolic
        else
            notify-send "VPN" "Connection failed" -i dialog-error
        fi
    fi
}

case "$1" in
    "status")
        get_vpn_info
        ;;
    "toggle")
        toggle_vpn
        ;;
    *)
        notify-send "VPN" "Connected successfully" -i network-vpn-symbolic
        get_vpn_info
        ;;
esac
