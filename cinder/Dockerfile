FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"

RUN apt-get install -y cinder-common cinder-api cinder-scheduler cinder-volume ceph
# Running services:
ADD ./supervisord.conf /etc/supervisord.conf
# Prepare environment
ADD ./prep.sh /srv/scripts/cinder-prep
RUN /srv/scripts/cinder-prep
# Setup links for config files
ADD ./link.sh /srv/scripts/link-config
RUN /src/scripts/link-config

CMD file /srv/c/cinder.conf && supervisord
# docker run -d -p 9191:9191 -p 9292:9292 -v /srv/c/cinder:/srv/c/cinder -v /srv/c/ceph:/etc/ceph controller/cinder