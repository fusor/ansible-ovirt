#!/bin/sh

# Run this as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as the root user... exiting."
  exit
fi

NETWORK="ansible_ovirt_demo_net"

##
# Check if the network already exist..if so? remove them
#
CHECK_NETWORK=`virsh net-list | grep  ${NETWORK}`
if [ "${CHECK_NETWORK}" != "" ]; then
  if [ "$1" = 'destroy' ] ; then
    (set -x
    virsh net-destroy  ${NETWORK}
    virsh net-undefine ${NETWORK}
    )
  fi
else
  set -x
  # define the network
  virsh net-define ./${NETWORK}.xml

  # start the network
  virsh net-start ${NETWORK}

  # restart the libvirtd service
  systemctl restart libvirtd.service
fi
