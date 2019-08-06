#!/bin/sh

set -x

docker run \
  --name=netdata \
  --detach \
  --restart=always \
  --publish 19999:19999 \
  --volume /etc/passwd:/host/etc/passwd:ro \
  --volume /etc/group:/host/etc/group:ro \
  --volume /proc:/host/proc:ro \
  --volume /sys:/host/sys:ro \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata