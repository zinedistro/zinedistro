#!/usr/bin/env bash
set -e

DEBIAN_FRONTEND=noninteractive

# Configure swap
# Create swapfile
sudo dd if=/dev/zero of=/swapfile bs=1024 count=256k

# Turn on swap
sudo mkswap /swapfile
sudo swapon /swapfile

if ! cat /etc/fstab | grep /swapfile
then
echo "/swapfile       none    swap    sw      0       0" | sudo tee -a /etc/fstab
fi

# Set swappiness to 10
echo 10 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 10 | sudo tee -a /etc/sysctl.conf

sudo chown root:root /swapfile
sudo chmod 0600 /swapfile

# Install Node.js
sudo apt-get update -qq
sudo apt-get install -y python-software-properties
sudo apt-add-repository -y ppa:chris-lea/node.js
sudo apt-get update -qq
sudo apt-get -y install curl git-core nodejs

# Install psql
apt-get install -y postgresql-client-common
apt-get install -y postgresql-client-9.3

# Configure rbenv
if [ -z "${RBENV_ROOT}" ]; then
  export RBENV_ROOT="/usr/local/rbenv"
fi

if ! cat ${HOME}/.bashrc | grep 'RBENV_ROOT="/usr/local/rbenv"'
then
  echo '
  export RBENV_ROOT="/usr/local/rbenv"
  if [ -d "${RBENV_ROOT}" ]; then
    export PATH="${RBENV_ROOT}/bin:${PATH}"
    eval "$(rbenv init -)"
  fi
  ' >> ${HOME}/.bashrc
fi

# Install rbenv
curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

export PATH="${RBENV_ROOT}/bin:${PATH}"
eval "$(rbenv init -)"

# Don't install gem documentation
echo "gem: --no-ri --no-rdoc" > /etc/gemrc

# Configure default gems for all rubies
echo "bundler" >> ${RBENV_ROOT}/default-gems

# Install prerequisites
rbenv bootstrap-ubuntu-12-04

# Install ruby 2.1.2
rbenv install 2.1.2
rbenv global 2.1.2

# Clean up APT when done
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
