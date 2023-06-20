#!/bin/bash

REPO_DIR=$(dirname $0)
ENV=$1

if [[ "$ENV" == "" ]]; then
    echo -e "==> Example usage:\n\t$ ./1_configure_proxmox.sh dev|prod"
    exit
fi

if [[ ( "$ENV" != "dev" ) && ( "$ENV" != "prod" ) ]]; then
    echo -e "==> Invalid ENV"
    echo -e "==> Example usage:\n\t$ ./1_configure_proxmox.sh dev|prod"
    exit
# else
#     echo -e "==> Received valid ENV: $ENV"
fi

echo -e "==> Configuring Proxmox"
ansible-playbook \
    -i $REPO_DIR/ansible/inv/$ENV.yml \
    $REPO_DIR/ansible/1_configure_proxmox.yml
