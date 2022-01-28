#!/usr/bin/bash

# Deploy CTs
terraform -chdir=terraform/ init
terraform -chdir=terraform/ plan
terraform -chdir=terraform/ apply -auto-approve

# Configure CTs
ansible-playbook -i ansible/inv.yml ansible/configure.yml