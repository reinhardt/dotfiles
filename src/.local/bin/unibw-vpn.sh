#!/usr/bin/env bash
openconnect --juniper webvpn.unibw.de/rz --user r11dslab --background
sleep 3
systemctl restart network-manager
route add -net 192.168.20.0/24 gw 137.193.15.180
ip link set dev tun0 mtu 1350
