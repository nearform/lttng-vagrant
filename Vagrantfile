# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20160620.0.0/providers/virtualbox.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :private_network, ip: '10.0.13.37'

  # uncomment the line below to create a shard workspace
  config.vm.synced_folder "./shared", "/vagrant/shared"

  config.vm.provision "docker" do |d|
  end
end
