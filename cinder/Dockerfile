FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"

RUN apt-get install -y cinder-common cinder-api cinder-scheduler cinder-volume ceph
# Running services:
ADD supervisord.conf /etc/supervisord.conf

ADD conf/ /etc/cinder
ADD ceph/ /etc/ceph
EXPOSE 8776

RUN /srv/cleanup.sh

CMD supervisord
# docker run -d -p 9191:9191 -p 9292:9292 -v /srv/c/cinder:/srv/c/cinder -v /srv/c/ceph:/etc/ceph controller/cinder