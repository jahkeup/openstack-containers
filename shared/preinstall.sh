#!/usr/bin/env bash
# This script prepares a common openstack env for isolate services
# This script is meant for use with Dockerfile and images.

# Install and configure SSH
apt-get install -y openssh-server sudo
sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd


# Add remote user
useradd cloud
RUN echo "cloud:$1$ren.WQsK$qagdprCRfiAcx7ZRjEryp/" | chpasswd -e
echo "cloud    ALL=NOPASSWD: ALL" >> /etc/sudoers.d/cloud_user

# Create groups
groupadd -g 220 keystone
groupadd -g 221 nova
groupadd -g 222 neutron
groupadd -g 223 cinder
groupadd -g 224 glance

# Crea†e users
useradd -u 220 -g 220 -d /var/lib/keystone keystone
useradd -u 221 -g 221 -d /var/lib/nova nova
useradd -u 222 -g 222 -d /var/lib/neutron neutron
useradd -u 223 -g 223 -d /var/lib/cinder cinder
useradd -u 224 -g 224 -d /var/lib/glance glance
