#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────────
# nmap_helper.sh
# A helper script to display commonly used nmap commands based on user input.
# ──────────────────────────────────────────────────────────────────────────────

# Prompt the user for the target IP or hostname
read -p "Enter target IP or hostname: " TARGET

# Prompt the user for ports (comma-separated or range); if blank, default to all TCP ports
read -p "Enter ports to scan (e.g. 22,80 or 1-100) [default: all ports]: " PORTS
if [ -z "$PORTS" ]; then
  PORTS="1-65535"
fi

# Blank line for readability in output
echo

echo "Here are some commonly used nmap commands for $TARGET (ports: $PORTS):"
echo "----------------------------------------------------------------------"

# 1) Ping scan (discovers which hosts are up without doing port scans)
echo
echo "1) Ping scan (host discovery only):"
echo "   nmap -sn $TARGET"

# 2) Default scripts & version detection on your chosen ports
echo
echo "2) Default script + version scan:"
echo "   nmap -sC -sV -p $PORTS $TARGET"

# 3) Aggressive scan (OS detection, version detection, scripts, traceroute)
echo
echo "3) Aggressive scan:"
echo "   nmap -A -p $PORTS $TARGET"

# 4) Full TCP port scan (all 65,535 ports)
echo
echo "4) Scan all TCP ports:"
echo "   nmap -p- $TARGET"

# 5) OS detection only (skips ping to avoid firewalls dropping probes)
echo
echo "5) OS detection (no ping):"
echo "   nmap -O -Pn $TARGET"
