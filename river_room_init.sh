#!/bin/bash

# --- Outlaw Labs: River Room Manufacturing Controller ---
# Purpose: Initialize and monitor self-assembling 3D printer farm

PRINTER_IPS=("192.168.1.101" "192.168.1.102" "192.168.1.103")

echo "[!] Initializing River Room Manufacturing Plant..."

for ip in "${PRINTER_IPS[@]}"; do
    echo "[*] Checking Status for Printer: $ip"
    ping -c 1 $ip > /dev/null
    
    if [ $? -eq 0 ]; then
        echo "[+] Printer $ip is ONLINE. Ready for assembly tasks."
    else
        echo "[-] WARNING: Printer $ip is OFFLINE. Check power and network."
    fi
done

echo "[!] Initialization Complete. Awaiting production queue."
