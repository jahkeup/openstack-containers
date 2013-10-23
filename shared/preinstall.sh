#!/usr/bin/env bash
# This script prepares a common openstack env for isolate services
# This script is meant for use with Dockerfile and images.

# Install and configure SSH
apt-get install -y openssh-server
sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd

# Create groups
groupadd -g 220 keystone
groupadd -g 221 nova
groupadd -g 223 cinder
groupadd -g 224 glance
groupadd -g 226 neutron

# Crea†e users
useradd -u 220 -g 220 -d /var/lib/keystone keystone
useradd -u 221 -g 221 -d /var/lib/nova nova
useradd -u 223 -g 223 -d /var/lib/cinder cinder
useradd -u 224 -g 224 -d /var/lib/glance glance
useradd -u 226 -g 226 -d /var/lib/neutron neutron