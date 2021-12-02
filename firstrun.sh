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
	$(cat config_docker_image) \
	borgmatic -v1 --stats --files \
	--override=storage.unknown_unencrypted_repo_access_is_ok=true \
	--override=storage.relocated_repo_access_is_ok=true

