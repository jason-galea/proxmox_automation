#!/bin/bash

echo -e "\n==> Update package list"
sudo apt update -y

echo -e "\n==> Install apt packages"
sudo apt install -y sshpass graphviz

echo -e "\n==> Upgrade pip"
python3 -m pip install -U pip setuptools wheel

echo -e "\n==> Install pip requirements"
python3 -m pip install -r reqs.txt

echo -e "\n==> Install ansible-galaxy requirements"
ansible-galaxy collection install community.crypto ansible-galaxy ansible.posix

echo -e "\n==> Show ansible version"
ansible-playbook --version
