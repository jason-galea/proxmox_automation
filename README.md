# proxmox_automation
Automating Proxmox with Terraform and Ansible

## Requirements:

- Go (https://go.dev/doc/install)
- Terraform (https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Ansible

## Terraform Guides & Documentation:

- https://vectops.com/2020/05/provision-proxmox-vms-with-terraform-quick-and-easy/
- https://andrewbeaton.net/2019/10/20/using-terraform-to-create-a-linux-container-in-proxmox/
- https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/lxc

## Run Terraform

The Terraform ProxMox provider is installed during `terraform init`
```
terraform -chdir=terraform/ init
terraform -chdir=terraform/ plan
terraform -chdir=terraform/ apply -auto-approve
terraform -chdir=terraform/ destroy -auto-approve
```

## Run Ansible

```
ansible-playbook -i ansible/inv.yml ansible/???
```




