# borgmatic-docker

A wrapper for borg + borgmatic for these strange systems which are capable
of running Docker but have broken borg packages (yes, I'm looking at you,
FreePBX).

## Requirements

* Docker (tested on 1.13.1 and above)

## Install

It is assumed that you already have an initialized borg repository
and you can access the remote host using SSH public key.

```sh
cd /opt
git clone https://github.com/m1kc/borgmatic-docker.git
cd borgmatic-docker
# Edit settings
echo "myuser" > config_ssh_user
echo "borg.mycompany.local" > config_ssh_host
echo "Europe/Moscow" > config_timezone
nano config.yaml
```

Here you need to do some things:

1. Choose which folders you actually want to backup (`/host` corresponds to your filesystem root).
2. Set your repository location.
3. Adjust retention if needed (default is 5 daily + 3 weekly + 2 monthly).
4. Fill in your healthchecks.io key (or comment that section out, and hooks too).

```sh
./setupssh.sh
./firstrun.sh
./backup.sh
make install
# Activate daily backups
make activate
```

## Planned features

(for requests, create an issue or drop me a note at m1kc@yandex.ru)

* Let user choose image version

