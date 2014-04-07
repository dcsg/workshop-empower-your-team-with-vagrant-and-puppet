# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

vparams = YAML::load_file("./Vagrantparams.yml")

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu-precise12042-x64-vbox43"
    config.vm.box_url = "http://puphpet.s3.amazonaws.com/ubuntu-precise12042-x64-vbox43.box"

    # port forwarding
    config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

    # setup a private network with a static IP Address
    # nfs requires a static IP address
    config.vm.network :private_network, :ip => vparams['ip']

    # sharing folders    
    config.vm.synced_folder ".", "/vagrant", nfs: vparams['nfs']

    config.vm.provider "virtualbox" do |vb|
        #vb.gui = true     # enables GUI, defaults is false

        # Vagrant exposes a way to call  any command against VBoxManage
        # Example: Change the memory of the VM
        vb.customize ["modifyvm", :id, "--memory", vparams['memory']]
    end

    config.vm.provision :puppet do |puppet|
        # defines the puppet folder
        puppet.manifests_path = "vagrant/puppet/manifests"
        # initial manifest
        puppet.manifest_file = "init.pp"

        # defines the puppet modules folder
        puppet.module_path = "vagrant/puppet/modules"
        # set puppet options
        puppet.options = [
                        '--verbose',
                        #'--debug'
                      ]
    end

end
