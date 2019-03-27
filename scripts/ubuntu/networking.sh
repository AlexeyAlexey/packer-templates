#!/bin/sh -eux


echo "etc netplan list of files"
echo $(ls -l /etc/netplan)

mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.old

echo "Create netplan config for eth0"
cat <<EOF >> /etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: yes
      dhcp6: yes
      dhcp-identifier: 'mac'
EOF

echo "etc netplan list of files"
echo $(ls -l /etc/netplan)

echo "01-netcfg.yaml"

echo $(cat /etc/netplan/01-netcfg.yaml)


netplan apply