FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"
RUN apt-get update && apt-get install -y keystone

# Running services:
ADD ./supervisord.conf /etc/supervisord.conf

# BEGIN CONFIG
ADD /srv/c/keystone/keystone.conf /etc/keystone/keystone.conf

# END CONFIG

# Always run clean up before finishing.
RUN /srv/cleanup.sh

# Start service on default run
CMD supervisord