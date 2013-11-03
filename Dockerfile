FROM jahkeup/ubuntu:saucy
MAINTAINER Jacob Vallejo "you@jahkeup.com"
ADD ./shared/preinstall.sh /srv/preinstall.sh
ADD ./shared/cleanup.sh /srv/cleanup.sh
RUN /srv/preinstall.sh
RUN /srv/cleanup.sh
EXPOSE 22
CMD /usr/sbin/sshd -D