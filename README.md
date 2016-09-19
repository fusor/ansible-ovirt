Ansible module for installing and configuring Ovirt/RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
Requires the vagrant-libvirt plugin

To test these modules with upstream Ovirt on CentOS:
1. add the following lines to your /etc/hosts

    192.168.33.11 x1.example.org
    192.168.33.12 x2.example.org
    192.168.33.13 x3.example.org
    192.168.33.14 test-ovirt-engine.example.org

2. cd demo 
3. vagrant up
4. cd .. 
5.(a). To deploy self-hosted ovirt:

    ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant

5.(b). To deploy ovirt with separate engine + hypervisors:

    ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/vars.json" --private-key=/usr/share/vagrant/keys/vagrant
