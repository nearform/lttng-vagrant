# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.box_url = "https://atlas.hashicorp.com/hashicorp/boxes/precise64/versions/1.1.0/providers/virtualbox.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :private_network, ip: '10.0.13.37'

  config.vm.synced_folder "~/work/vagrant/shared", "/vagrant/shared"

  config.vm.provision "docker" do |d|
  end
end
