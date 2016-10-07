Ansible module for installing and configuring Ovirt/RHV (engine + hypervisor or self-hosted scenarios)

Requires ansible >= 2.1

# Testing Vagrant environment
Requires the `vagrant-libvirt` and `vagrant-hostmanager` plugins

Optionally uses the `vagrant-cachier` plugin, to cache packages between `vagrant up`s (strongly recommend for testing self-hosted, which downloads ~2GB of packages per deployment)

1. `cd demo`

1. `vagrant up`

    This will bring up 4 VMs
    - {x1|x2|x3}.example.org, each with 8GB of memory using all available processors
    - nfs.example.org, with 2GB memory and 1 CPU
    
    If you don't have enough resource to run all of them, you can specify the specific vms to bring up (the nfs VM will always be required):
    
    `vagrant up x1 nfs`

1. `cd ..`

1. (a) To deploy self-hosted ovirt:

    `ansible-playbook -i demo/self_hosted self_hosted.yml -e "@demo/self_hosted.json" --private-key=/usr/share/vagrant/keys/vagrant`

   (b) To deploy ovirt with separate engine + hypervisors:

    `ansible-playbook -i demo/engine_and_hypervisor engine_and_hypervisor.yml -e "@demo/engine_and_hypervisor.json" --private-key=/usr/share/vagrant/keys/vagrant`
    
    *Note* If you did not bring up all of the VMs when you ran vagrant up, you will need to explicitly exclude the hosts that are down from the playbook run. You can do this by appending `--limit '!x2.example.org:!x3.example.org'` to the above commands, replacing x1/x2.example.org with the hosts that are down.
