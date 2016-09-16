Ansible module for installing and configuring RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
To test these modules with upstream Ovirt on CentOS, just clone the project, run vagrant up, and then run

    ansible-playbook -i self_hosted self_hosted.yml -e "@vars.json" --private-key=/usr/share/vagrant/keys/vagrant

to test self-hosted, or

    ansible-playbook -i engine_and_hypervisor engine_and_hypervisor.yml -e "@vars.json" --private-key=/usr/share/vagrant/keys/vagrant

to test engine and hypervisor.
