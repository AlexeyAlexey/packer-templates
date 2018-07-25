#!/bin/sh

set -e
set -x

date | sudo tee /etc/vagrant_box_build_time

pubkey_url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub";
mkdir -p ~/.ssh;
if command -v wget >/dev/null 2>&1; then
    wget --no-check-certificate "$pubkey_url" -O ~/.ssh/authorized_keys;
elif command -v curl >/dev/null 2>&1; then
    curl --insecure --location "$pubkey_url" > ~/.ssh/authorized_keys;
else
    echo "Cannot download vagrant public key";
    exit 1;
fi

cat ~/.ssh/authorized_keys
# chmod 700 ~/.ssh/
# cat ~/.ssh/authorized_keys
# chmod 600 ~/.ssh/authorized_keys

chown -R vagrant ~/.ssh;
chmod -R go-rwsx ~/.ssh;