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

make_nfs_share /nfs_data/ovirt_storage
make_nfs_share /nfs_data/self_hosted
make_nfs_share /nfs_data/export

exportfs -ra
systemctl start nfs
