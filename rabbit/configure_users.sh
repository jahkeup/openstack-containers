#!/usr/bin/env bash

# Rabbit must be started to modify users
echo "Starting rabbit server"
rabbitmq-server 2>&1 >/dev/null &
SERVER_PID=$!

# Wait for the server to start..
echo "Waiting to warn up before configure."
sleep 5;

if [ ! -f /srv/rabbit_passwords.txt ]; then
    echo "Cannot find rabbit password file. Cannot make users." 1>&2
    exit 1
fi
echo "Processing rabbit users"
# For each user line entry in the file, create them or change them.
# The only user that exists by default is guest.
for line in $(cat /srv/rabbit_passwords.txt); do
    user=$(echo $line | awk -F: '{print $1}')
    pass=$(echo $line | awk -F: '{print $2}')
    echo "Configuring user $user."
    if [ "$user" = "guest" ]; then
        rabbitmqctl change_password guest "$pass"
    else
        rabbitmqctl add_user "$user" "$pass"
    fi
done

kill $SERVER_PID
