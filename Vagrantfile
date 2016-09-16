# -*- mode: ruby -*-
# vi: set ft=ruby :

system("sudo ./setup_demo_network.sh")

Vagrant.configure("2") do |config|
  config.vm.box = "centos-7.0-x86_64"
  config.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-1601_01.LibVirt.box"
  config.ssh.insert_key = false

  config.vm.provision :shell, :path => "centos_7_x.sh"

  config.vm.define :x1 do |x1|
    x1.vm.hostname = 'x1'
    x1.vm.network :public_network, :type => 'bridge', :dev=> 'virbr40', :mac => "12:11:22:33:44:55"
  end

  config.vm.define :x2 do |x2|
    x2.vm.hostname = 'x2'
    x2.vm.network :public_network, :type => 'bridge', :dev=> 'virbr40', :mac => "12:11:22:33:44:56"
  end

  config.vm.define :x3 do |x3|
    x3.vm.hostname = 'x3'
    x3.vm.network :public_network, :type => 'bridge', :dev=> 'virbr40', :mac => "12:11:22:33:44:57"
  end

  config.vm.provider :libvirt do |libvirt, override|
    libvirt.driver = "kvm"
    libvirt.memory = 8192
    libvirt.cpus = `grep -c ^processor /proc/cpuinfo`.to_i
  end

end
