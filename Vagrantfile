# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'docker'

# http://www.talkingquickly.co.uk/2014/06/rails-development-environment-with-vagrant-and-docker/
# Commands required to setup working docker environment, link
# containers etc.
$setup = <<SCRIPT
usermod -aG docker vagrant
docker -d &

cd /vagrant
docker build -t zinedistro_web .

# bin/bootstrap
SCRIPT

# Commands required to ensure correct docker containers
# are started when the vm is rebooted.
$start = <<SCRIPT
# docker start zinedistro-db
# docker start zinedistro-web
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  # Install Ubuntu in the docker host VM
  config.vm.box = "99designs/ubuntu-docker"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.provider "vmware_fusion" do |v, override|
    override.vm.box = "99designs/ubuntu-docker"
  end

  config.vm.network "private_network", ip: "192.168.50.4"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  for i in 49000..49900
    config.vm.network "forwarded_port", guest: i, host: i
  end

  # Must use NFS for this otherwise rails
  # performance will be awful
  config.vm.synced_folder ".", "/app", type: "nfs"

  # config.vm.provider "docker" do |d|
  #   d.build_image "."
  # end

  # config.vm.provision "docker" do |d|
  #   d.pull_images "faun/ruby-2.1"
  #   d.pull_images "orchardup/postgresql"
  #   d.run "zinedistro-web",
  #      cmd: "bash -l",
  #      args: "-v '/app:/home/app/zinedistro'"
  # end

  # Setup the containers when the VM is first
  # created
  config.vm.provision "shell", inline: $setup

  # Make sure the correct containers are running
  # every time we start the VM.
  # config.vm.provision "shell", run: "always", inline: $start
end
