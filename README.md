Ansible module for installing and configuring Ovirt/RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
Requires the vagrant-libvirt plugin

1. cd demo 

1. vagrant up

1. cd .. 

1. (a) To deploy self-hosted ovirt:

    ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant

1. (b) To deploy ovirt with separate engine + hypervisors:

    ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant
