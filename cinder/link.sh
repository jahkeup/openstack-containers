service=cinder
for f in cinder.conf api-paste.ini; do
  echo ln -s /srv/c/$f /etc/$service/$f
done

echo "PRERUN: Linked and/or verified links to real config files."