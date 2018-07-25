#!/bin/bash

set -e
set -x

sudo apt-get clean

echo "cleaning up dhcp leases"
rm -f /var/lib/dhcp/*

echo "cleaning up udev rules"
rm -f /etc/udev/rules.d/70-persistent-net.rules
# sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

# echo "pre-up sleep 2" >> /etc/network/interfaces;
# http://linuxway.ru/poleznoe/kak-nastroit-dhcp-klient/


# echo 'pre-up sleep 2' | sudo tee --append /etc/network/interfaces
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s1-networkscripts-interfaces
# for nic in /etc/sysconfig/network-scripts/ifcfg-p*; do sed -i /HWADDR/d $nic; done

exit 0
