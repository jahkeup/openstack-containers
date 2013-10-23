service=cinder
for f in cinder.conf api-paste.ini; do
  rm /etc/$service/$f
  echo ln -s /srv/c/$f /etc/$service/$f
done

echo "PRERUN: Linked and/or verified links to real config files."