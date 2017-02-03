# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled     = true
    config.hostmanager.manage_host = true
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define :web, primary: true do |web|
    web.vm.box = "ubuntu/xenial64"
    web.vm.hostname = "web.hr"
    web.vm.synced_folder "web/", "/vagrant"
    web.vm.network :private_network, ip: "192.168.56.10"

    web.vm.provision :shell, path: "./web/web.sh"

    web.vm.provider :virtualbox do |v|
      v.name = "web.hr"
      v.memory = "1024"
    end
  end

  config.vm.define :data do |data|
    data.vm.box = "ubuntu/xenial64"
    data.vm.hostname = "data.hr"
    data.vm.synced_folder "data/", "/vagrant"
    data.vm.network :private_network, ip: "192.168.56.20"

    data.vm.provision :shell, path: "./data/data.sh"

    data.vm.provider :virtualbox do |v|
      v.name = "data.hr"
      v.memory = "1024"
    end
  end

end
