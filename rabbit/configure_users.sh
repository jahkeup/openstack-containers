#!/usr/bin/env bash

# Rabbit must be started to modify users
rabbitmq-server&
SERVER_PID=$!

# Wait for the server to start..
sleep 5;

if [ ! -f /srv/rabbit_passwords.txt ]; then
    echo "Cannot find rabbit password file. Cannot make users." 1>&2
    exit 1
fi

# For each user line entry in the file, create them or change them.
# The only user that exists by default is guest.
for line in $(cat /srv/rabbit_passwords.txt); do
    user=$(echo $line | awk -F: '{print $1}')
    pass=$(echo $line | awk -F: '{print $2}')
    if [ "$user" = "guest" ]; then
        rabbitmqctl change_password guest "$pass"
    else
        rabbitmqctl add_user "$user" "$pass"
    fi
done

kill $SERVER_PID
