# proxmox_automation
Automating Proxmox with Ansible


## Summary

This repo is intended to configure a physical device, running a fresh Proxmox installation.

The goal for this device is to host:

- Proxmox itself
- A few CTs for critical services, such as DNS
- A VM running Portainer, for services hosted with docker
- Misc. VMs/CTs for services not using docker

It is advised to clear a range of IPs in your local subnet, as Proxmox + each VM/CT expects its own IP.

## Instructions

1. Manually install Proxmox on your chosen device:
    - Download the installer ISO from [proxmox.com](https://www.proxmox.com/en/downloads/category/iso-images-pve)
    - Boot the ISO from a USB with Ventoy, Rufus, etc.
    - Accept default options for everything
    - Set a static IP
    - **Remember the password & IP!**
    - Restart
    - Login and verify internet access

2. Clone this repo:
    - `git clone https://github.com/jason-galea/proxmox_automation.git`

3. Install dependencies:
    - `./setup.sh`

4. Set your subnet & host IPs in `inv.yml`
    - `vi ansible/inv.yml`

5. Set your Proxmox password:
    - `vi password.txt`

6. Run initial Proxmox configuration with Ansible:
    - `ansible-playbook -i ansible/inv.yml ansible/prox_initial_config.yml`

7. Create the Pihole container, for DNS
    - `ansible-playbook -i ansible/inv.yml ansible/deploy_pihole.yml`
