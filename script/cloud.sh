#!/bin/bash -eux


wget https://apt.puppetlabs.com/puppet5-release-bionic.deb
sudo dpkg -i puppet5-release-bionic.deb
apt update


apt-get -y upgrade



# Installs cloudinit, epel is required
apt-get -y install cloud-init cloud-utils cloud-initramfs-growroot
apt-get -y puppet-agent

# configure cloud init 'cloud-user' as sudo
# this is not configured via default cloudinit config
cat > /etc/cloud/cloud.cfg.d/O2_user.cfg <<EOL
system_info:
  default_user:
    name: cloud-user
    lock_passwd: true
    gecos: Cloud user
    groups: [wheel, adm]
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    shell: /bin/bash
EOL

echo 'test'
exit 0