FROM jahkeup/ubuntu:saucy
MAINTAINER Jacob Vallejo "you@jahkeup.com"
ADD ./shared/preinstall.sh /srv/preinstall.sh
RUN /srv/preinstall.sh