#! /bin/bash

function make_nfs_share {
  _path=$1
  if [ -d "$_path" ]
  then
    echo "$_path already exists"
    # skip
  else
    mkdir -p $_path
    chmod -R +755 $_path
    chown -R 36:36 $_path
    grep -q -e "$_path \*(rw)" /etc/exports || (echo "$_path *(rw)" >> /etc/exports)
    echo "$_path share created"
  fi
}

set -x

make_nfs_share /nfs_data/ovirt_storage
make_nfs_share /nfs_data/self_hosted
make_nfs_share /nfs_data/export

exportfs -ra

iptables -A INPUT -s 192.168.33.0/24 -d 192.168.33.0/24 -p udp -m multiport --dports 10053,111,2049,32769,875,892 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -s 192.168.33.0/24 -d 192.168.33.0/24 -p tcp -m multiport --dports 10053,111,2049,32803,875,892 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -s 192.168.33.0/24 -d 192.168.33.0/24 -p udp -m multiport --sports 10053,111,2049,32769,875,892 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -s 192.168.33.0/24 -d 192.168.33.0/24 -p tcp -m multiport --sports 10053,111,2049,32803,875,892 -m state --state ESTABLISHED -j ACCEPT
iptables -I INPUT  -i lo -d 127.0.0.1 -j ACCEPT
iptables -I OUTPUT  -o lo -s 127.0.0.1 -j ACCEPT
iptables -L -n --line-numbers

systemctl start nfs
