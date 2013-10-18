FROM jahkeup/ubuntu:saucy
MAINTAINER Jacob Vallejo "you@jahkeup.com"

RUN apt-get install -y keystone
# Running services:
ADD ./supervisord.conf /etc/supervisord.conf
# VOLUME /srv/var/log/keystone /var/log/keystone
# testing lol
VOLUME /etc /tmp/lol
# VOLUME /srv/keystone /etc/keystone
# Start service on run
ENTRYPOINT ["supervisord"]