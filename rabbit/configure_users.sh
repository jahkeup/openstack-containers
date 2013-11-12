#!/usr/bin/env bash

if [ ! -f /srv/rabbit_passwords.txt ]; then
    echo "Cannot find rabbit password file. Cannot make users." 1>&2
    exit 1
fi

for line in $(cat /srv/rabbit_passwords.txt); do
    user=$(echo $line | awk -F: '{print $1}')
    pass=$(echo $line | awk -F: '{print $2}')
    if [ "$user" = "guest" ]; then
	rabbitmqctl change_password guest "$pass"
    else
	rabbitmqctl add_user "$user" "$pass"
    fi
done
