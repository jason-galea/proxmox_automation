#!/bin/bash

echo -e "\n==> Updating package list"
sudo apt update -y

echo -e "\n==> Install 'sshpass'"
sudo apt install -y sshpass

echo -e "\n==> Upgrade pip"
python3 -m pip install -U pip setuptools wheel

echo -e "\n==> Install pip requirements"
python3 -m pip install -r reqs.txt

echo -e "\n==> Show ansible version"
ansible-playbook --version
