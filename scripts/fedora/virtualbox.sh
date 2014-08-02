#!/bin/bash

set -e
set -x

sudo yum -y install bzip2
sudo yum -y install dkms
sudo yum -y install kernel-devel
sudo yum -y install make

# Uncomment this if you want to install Guest Additions with support for X
#sudo yum -y install xorg-x11-server-Xorg

# In Fedora 19 or earlier, dkms package provides SysV init script called
# dkms_autoinstaller that is enabled by default
if systemctl list-unit-files | grep -q dkms.service; then
  sudo systemctl start dkms
  sudo systemctl enable dkms
fi

sudo mount -o loop ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
