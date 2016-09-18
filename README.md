Ansible module for installing and configuring Ovirt/RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
Requires the vagrant-libvirt plugin

To test these modules with upstream Ovirt on CentOS, just clone the project, cd into the demo directory, run vagrant up, cd back to project root, and run:

    ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant

to test self-hosted, or

    ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant

to test engine and hypervisor.
