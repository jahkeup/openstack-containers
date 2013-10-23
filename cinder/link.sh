#!/usr/bin/env bash
service=cinder
for f in cinder.conf api-paste.ini; do
  ln -s -f /srv/c/$service/$f /etc/$service/$f
done

echo "PRERUN: Linked and/or verified links to real config files."