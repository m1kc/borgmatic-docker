#!/bin/bash
set -e
set -x

ssh "$(cat config_ssh_user)@$(cat config_ssh_host)" /bin/true

