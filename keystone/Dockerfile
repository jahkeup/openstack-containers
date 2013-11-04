FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"
RUN apt-get update && apt-get install -y keystone python-mysqldb

# Running services:
ADD supervisord.conf /etc/supervisord.conf

# Keystone Config
ADD conf/ /etc/keystone
EXPOSE 35357
EXPOSE 5000

# Always run clean up before finishing.
RUN /srv/cleanup.sh

# Start service on default run, run with a -l to get an admin prompt.
ENTRYPOINT /bin/bash
CMD supervisord