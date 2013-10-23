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
CMD /srv/scripts/link-config && file /srv/c/.salted && supervisord