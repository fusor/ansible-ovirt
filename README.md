Ansible module for installing and configuring Ovirt/RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
Requires the vagrant-libvirt plugin
Optionally can use the vagrant-cachier plugin, to cache packages between vagrant ups (strongly recommend for testing self-hosted, which downloads ~2GB of packages per deployment)

1. `cd demo`

1. `vagrant up`

    This will bring up 4 VMs
    - {x1|x2|x3}.example.org, each with 8GB of memory using all available processors
    - nfs.example.org, with 2GB memory and 1 CPU

1. `cd ..`

1. (a) To deploy self-hosted ovirt:

    `ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant`

   (b) To deploy ovirt with separate engine + hypervisors:

    `ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant`


Single line pasteable versions of the commands:
- self-hosted
```
    (cd demo ; vagrant up) && ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant
```
- engine + hypervisor
```
    (cd demo ; vagrant up) && ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant
```
