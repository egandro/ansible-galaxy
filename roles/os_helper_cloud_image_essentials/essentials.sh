#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get install -y nfs-common locales-all qemu-guest-agent
systemctl enable qemu-guest-agent
systemctl start qemu-guest-agent
update-locale LANG=C.UTF-8