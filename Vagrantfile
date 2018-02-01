# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Use Ubuntu 14.04
  config.vm.box = "ubuntu/trusty64"

  # Fix Vagrant box IP
  config.vm.network "private_network", ip: "192.168.33.10"

  # Forward port 8080:8080
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.install = true
    ansible.playbook = "playbook.yml"

    ansible.extra_vars = {
      network_private_address: "{{ ansible_eth0.ipv4.address }}"
    }
  end
end
