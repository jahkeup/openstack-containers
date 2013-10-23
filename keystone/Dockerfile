FROM jahkeup/ubuntu:saucy
MAINTAINER Jacob Vallejo "you@jahkeup.com"

RUN apt-get install -y keystone
# Running services:
ADD ./supervisord.conf /etc/supervisord.conf
# Start service on run
# This requires that the bind be made with -v /srv/etc/keystone:/etc/keystone:ro
ENTRYPOINT file /etc/keystone/.salted && supervisord