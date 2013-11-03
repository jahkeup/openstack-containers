#!/usr/bin/env bash
# Clean up apt
apt-get clean
rm -rf /var/lib/apt/lists/*
mkdir /var/lib/apt/lists/partial && touch /var/lib/apt/lists/lock