#!/usr/bin/env bash
# This script prepares a common openstack env for isolated services
# This script is meant for use with Dockerfile and images.

# Install and configure SSH + Common Deps
apt-get install -y openssh-server sudo traceroute dnsutils less vim net-tools \
                   python-MySQLdb python-pip telnet

# Make sshd login behave properly
sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/sshd
mkdir /var/run/sshd


# Add remote user
useradd cloud -m -s /bin/bash
echo 'cloud:$6$I0AFz22S$.8ffn3MMC43/2RvCABYIO5IEBscA0tO2R3JYPStYOoOC6pfIRS1ybpT0ReGrv6y1pzDY9b/lO.jjf08SrsU0f1' | chpasswd -e
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
