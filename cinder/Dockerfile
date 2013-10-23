FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"

RUN apt-get install -y cinder-common cinder-api cinder-scheduler cinder-volume
# Running services:
ADD ./supervisord.conf /etc/supervisord.conf
# Prepare environment
ADD ./prep.sh /srv/scripts/cinder-prep
RUN /srv/scripts/cinder-prep
# And set default to run only when .salted (from bound dir) is
# present.
ADD ./link.sh /srv/scripts/link-config
ENTRYPOINT ["/bin/bash -c /srv/scripts/link-config"]
CMD && file /srv/c/.salted && supervisord