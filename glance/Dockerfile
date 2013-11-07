FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"
RUN apt-get update && apt-get install -y glance-api glance-registry python-ceph ceph-common
# Running services:
ADD supervisord.conf /etc/supervisord.conf

# glance Config
ADD conf/ /etc/glance
# Ceph config that is necessary.
ADD ../ceph/conf /etc/ceph
EXPOSE 9292
EXPOSE 9191

# Always run clean up before finishing.
RUN /srv/cleanup.sh

# Shell: docker run -t -i -dns 192.0.2.1 controller/glance bash
CMD supervisord