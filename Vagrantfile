# -*- mode: ruby -*-
# vi: set ft=ruby :

$setup = <<SCRIPT
if ! cat ~/.bashrc | grep "cd /home/app/zinedistro" > /dev/null
then
  echo "cd /home/app/zinedistro" >> ~/.bashrc
fi

cd /home/app/zinedistro
./bin/bootstrap
SCRIPT

# Ensure correct docker containers are started when the vm is rebooted.
$start = <<SCRIPT
cd /home/app/zinedistro
./bin/start
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "phusion/ubuntu-14.04-amd64"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"

  config.vm.provider :vmware_fusion do |f, override|
    override.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vmwarefusion.box"
  end

  # Must use NFS for this otherwise rails performance will be awful
  config.vm.synced_folder ".", "/home/app/zinedistro", type: "nfs"

  # Disable the default synced directory
  config.vm.synced_folder ".", "/vagrant", disabled: true

  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?
    # Install Docker
    pkg_cmd = "wget -q -O - https://get.docker.io/gpg | apt-key add -;" \
      "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list;" \
      "apt-get update -qq; apt-get install -q -y --force-yes lxc-docker; "
    # Add vagrant user to the docker group
    pkg_cmd << "usermod -a -G docker vagrant; "
    config.vm.provision :shell, :inline => pkg_cmd
  end

  config.vm.provision :shell, inline: $setup
  config.vm.provision :shell, run: "always", inline: $start
end
