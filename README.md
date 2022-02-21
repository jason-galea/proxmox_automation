# proxmox_automation
Automating Proxmox with Ansible

# Requirements
1. A proxmox host, with SSH access
2. Python, version 3.8 or higher
3. Ansible, proxmoxer, and requests:
    - `python3 -m pip install ansible proxmoxer requests`

# Instructions
Prepare:
- `git clone https://github.com/jason-galea/proxmox_automation.git`
- `cd proxmox_automation`
- `echo 'PASSWORD_GO_HERE' > password.txt`

Run:
- `ansible-playbook -i inv.yml deploy.yml`

Destroy containers:
- `ansible-playbook -i inv.yml destroy.yml`

Destroy vzdump backups:
- `ansible-playbook -i inv.yml destroy_templates.yml`