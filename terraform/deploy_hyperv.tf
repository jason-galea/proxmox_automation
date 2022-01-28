# TODO:
# Currently the test environment (Proxmox & OPNsense on Hyper-V) is manually configured
# This file would automate the deploy of that test environment



### Steps to install proxmox:
### Boot ISO, leave default disk, enter country/timezone, hostname/IP/Gateway/DNS

### (Remove previous SSH host)
# ssh-keygen -f "/home/jg/.ssh/known_hosts" -R "172.26.0.2"

### Add SSH key for root
# ssh-copy-id -o "StrictHostKeyChecking no" root@172.26.0.2

### SSH as root
# ssh root@172.26.0.2

    ### Add non-subscription repo
    # echo "" >> sources.list
    # echo "# PVE pve-no-subscription repository provided by proxmox.com," >> sources.list
    # echo "# NOT recommended for production use" >> sources.list
    # echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" >> sources.list

    ### Disable enterprise repo
    # rm /etc/apt/sources.list.d/pve-enterprise.list

    ### Update at install sudo
    # apt update -y && apt dist-upgrade -y && apt install sudo -y

    ### Create user "prox":
    # useradd -s /usr/bin/bash -md /home/prox -G sudo prox
    # passwd prox
    # pveum user add prox@pam
    # pveum acl modify / --roles PVEAdmin --users prox@pam

    ### Grant "prox" passwordless sudo
    # echo "prox  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/prox
    ### OR:
    # sed -i 's/.*%sudo.*/%sudo ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

    ### Download most recent ubuntu CT template
    # pveam update
    # pveam available | grep ubuntu | awk '{print $2}' | sort | tail -n 1 | xargs pveam download local

    ### Exit SSH
    # exit

### Add SSH key for "prox"
# ssh-copy-id -o "StrictHostKeyChecking no" prox@172.26.0.2

### (Verify)
# ssh prox@172.26.0.2
# Access website: https://172.26.0.2:8006/
# Deploy CTs: ./deploy.sh