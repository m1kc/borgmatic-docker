all:
	echo Specify a target.

install:
	mkdir -p /etc/systemd/system/
	cp -v borgmatic-docker.service /etc/systemd/system/
	cp -v borgmatic-docker.timer /etc/systemd/system/
	systemctl daemon-reload

activate:
	systemctl enable --now borgmatic-docker.timer
