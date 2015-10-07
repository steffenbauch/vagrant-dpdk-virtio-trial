# -*- mode: ruby -*-
# vi: set ft=ruby :

require File.dirname(__FILE__) + '/vagrant-provision-reboot-plugin'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
	config.vm.define "generator" do |generator|
		generator.vm.box = "ubuntu/vivid64"
		config.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
			vb.cpus = 2
			vb.gui = true
			vb.customize ["modifyvm", :id, "--nic2", "intnet"]
			vb.customize ["modifyvm", :id, "--nic3", "intnet"]
			vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
			vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
			vb.customize ["modifyvm", :id, "--nictype3", "virtio"]
			vb.customize ["modifyvm", :id, "--intnet2", "gentorcv"]
			vb.customize ["modifyvm", :id, "--intnet3", "rcvtogen"]
			vb.customize ["modifyvm", :id, "--nicpromisc1", "allow-all"]
			vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
			vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
			vb.customize ["setextradata", :id, "VBoxInternal/CPUM/SSE4.1", "1"]
			vb.customize ["setextradata", :id, "VBoxInternal/CPUM/SSE4.2", "1"]
		end
		generator.vm.provision :shell, inline: "cd /vagrant; ./install-generator.sh", :privileged => false
		generator.vm.provision :unix_reboot
		generator.vm.provision :shell, inline: "cd /vagrant; ./compile-dpdk.sh", :privileged => false
		generator.vm.provision :shell, run: "always", inline: "cd /vagrant; ./configure-dpdk.sh", :privileged => false
	end


        config.vm.define "receiver" do |receiver|
                receiver.vm.box = "ubuntu/vivid64"
                config.vm.provider "virtualbox" do |vb|
                        vb.memory = "2048"
                        vb.cpus = 1
                        vb.gui = true
                        vb.customize ["modifyvm", :id, "--nic2", "intnet"]
                        vb.customize ["modifyvm", :id, "--nic3", "intnet"]
                        vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
                        vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
                        vb.customize ["modifyvm", :id, "--nictype3", "virtio"]
                        vb.customize ["modifyvm", :id, "--intnet2", "gentorcv"]
                        vb.customize ["modifyvm", :id, "--intnet3", "rcvtogen"]
                        vb.customize ["modifyvm", :id, "--nicpromisc1", "allow-all"]
                        vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
                        vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"]
                        vb.customize ["setextradata", :id, "VBoxInternal/CPUM/SSE4.1", "1"]
                        vb.customize ["setextradata", :id, "VBoxInternal/CPUM/SSE4.2", "1"]
                end
        end

end
