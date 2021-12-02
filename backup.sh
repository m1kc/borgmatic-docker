#!/bin/bash
set -e
set -x

docker run --rm \
	-v /:/host:ro \
	-v "$(pwd)/config.yaml:/etc/borgmatic/config.yaml:ro" \
	-v /root/.config/borg:/root/.config/borg:rw \
	-v /root/.ssh:/root/.ssh:rw \
	-v /root/.cache/borg:/root/.cache/borg:rw \
	-e TZ=$(cat config_timezone) \
	--net=host \
	b3vis/borgmatic:v1.1.17-1.5.18 \
	borgmatic -v1 --stats

