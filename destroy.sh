#!/usr/bin/bash

# Destroy CTs
# terraform -chdir=terraform/ init
# terraform -chdir=terraform/ plan
terraform -chdir=terraform/ destroy -auto-approve

# Remove old SSH hosts
ansible-playbook -i ansible/inv.yml ansible/remove_ssh_hosts.yml