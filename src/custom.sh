#!/bin/bash

set -e

echo "$(git ls-remote https://github.com/jeksterslab/docker-r2u.git main)" > /etc/profile.d/container_init.sh
awk '{print $1 > "/etc/profile.d/container_init.sh"}' /etc/profile.d/container_init.sh
CONTAINER_RELEASE=$(cat /etc/profile.d/container_init.sh)
echo "export CONTAINER_RELEASE=$CONTAINER_RELEASE" > /etc/profile.d/container_init.sh
CONTAINER_RELEASE_MSG="\"This release is based on the commit $CONTAINER_RELEASE.\""
echo "export CONTAINER_RELEASE_MSG=$CONTAINER_RELEASE_MSG" >> /etc/profile.d/container_init.sh

mkdir -p /srv/build
touch /srv/build/CONTAINER_RELEASE_MSG
touch /srv/build/CONTAINER_RELEASE
echo "$CONTAINER_RELEASE_MSG" > /srv/build/CONTAINER_RELEASE_MSG
sed -i s/\"//g /srv/build/CONTAINER_RELEASE_MSG
echo "$CONTAINER_RELEASE" > /srv/build/CONTAINER_RELEASE