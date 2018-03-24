# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20180214.0.0"

  # Setting VM name to <folder>_VerticalServer_<TIMESTAMP>
  config.vm.define "dpp-tooling-vm" do |pp|
  end

  # vagrant plugin install vagrant-proxyconf
  #config.proxy.http     = "http://a-proxy-p.bc.jsplc.net:8080"
  #config.proxy.https    = "http://a-proxy-p.bc.jsplc.net:8080"
  #config.proxy.no_proxy = "localhost,.dev,.local,.internal,192.168/16,10.0/8,172.16/12,169.254/16,.js-devops.co.uk"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 7180, host: 7180
  config.vm.network "forwarded_port", guest: 7181, host: 7181
  config.vm.network "forwarded_port", guest: 7182, host: 7182
  config.vm.network "forwarded_port", guest: 7183, host: 7183
  config.vm.network "forwarded_port", guest: 7184, host: 7184
  config.vm.network "forwarded_port", guest: 7185, host: 7185
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 11000, host: 11000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.synced_folder "../", "/home/vagrant/git", type: "virtualbox"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "6000"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "100"] #limit the use of cpu to 100%
    vb.customize ["modifyvm", :id, "--ioapic", "on"] #needed to use more cpus
    vb.customize ["modifyvm", :id, "--cpus", "4"]  #enable 4 cpus for the vm
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]  #fix dns
  end
  # Customize the amount of memory on the VM:
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/provision.yml"
    ansible.install = false
  end
end
