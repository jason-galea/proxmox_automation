#!/bin/bash

REPO_DIR=$(dirname $0)
ENV=$1
PLAYBOOK=$2

if [ "$ENV" == "" ] || [ "$PLAYBOOK" == "" ]; then
    echo -e "==> Example usage:\n\t$ ./$PLAYBOOK.sh dev|prod playbook_name"
    exit
fi

if [[ ( "$ENV" != "dev" ) && ( "$ENV" != "prod" ) ]]; then
    echo -e "==> Invalid ENV"
    echo -e "==> Example usage:\n\t$ ./$PLAYBOOK.sh dev|prod playbook_name"
    exit
fi

echo -e "==> Configuring Proxmox"
ansible-playbook \
    -i $REPO_DIR/ansible/inv/$ENV.yml \
    $REPO_DIR/ansible/$PLAYBOOK.yml
