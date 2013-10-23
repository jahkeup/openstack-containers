#!/usr/bin/env bash
mkdir -p /var/run/cinder
chown cinder:cinder /var/run/cinder
mkdir -p /var/lock/cinder
chown cinder:root /var/lock/cinder