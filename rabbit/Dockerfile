FROM controller
MAINTAINER Jacob Vallejo "you@jahkeup.com"
RUN apt-get update && apt-get install -y rabbitmq-server

# Add services to be run
ADD supervisord.conf /etc/supervisord.conf

# Setup the rabbit users for the cluster*
ADD conf/rabbit_passwords.txt /srv/rabbit_passwords.txt
ADD configure_users.sh /srv/configure_users.sh
RUN /srv/configure_users.sh

# Always run the cleanup script 
RUN /srv/cleanup.sh

# Starts rabbit and sshd
CMD supervisord