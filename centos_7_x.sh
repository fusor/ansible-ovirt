#!/usr/bin/env bash

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi
(set -x

# HACK
# swap name resolution order
mv /etc/resolv.conf /etc/resolv.conf.bak
(tac /etc/resolv.conf.bak) > /etc/resolv.conf

# Enable root ssh key access
cp -R /home/vagrant/.ssh /root/.ssh

# Enable ovirt.org repository
yum install -y http://resources.ovirt.org/pub/yum-repo/ovirt-release40.rpm

)
