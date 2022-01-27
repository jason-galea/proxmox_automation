# TODO:
# - Multiple CTs with different configurations
# - Import variables from files (preferably YAML)
# - Static IPs
# - Import SSH keys

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.4" # Latest release: https://github.com/Telmate/terraform-provider-proxmox/releases
    }
  }
}

provider "proxmox" {
  # TODO: Move these variables into a file
  pm_tls_insecure = true
  pm_api_url = "https://172.26.0.2:8006/api2/json"
  pm_user = "prox@pam"
  pm_password = file("password.txt")
}

resource "proxmox_lxc" "basic" {
  for_each        = var.lxc_info

  hostname        = each.key
  vmid            = each.value.id
  target_node     = "prox"
  ostemplate      = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  password        = file("password.txt")
  unprivileged    = true
  ostype          = "ubuntu"
  ssh_public_keys = file("~/.ssh/id_rsa.pub") # Authenticate localhost SSH key
  start           = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    # ip     = "dhcp"
    # ip     = "10.0.0.2/24"
    ip     = format("%s%s/%s", var.lxc_network, each.value.id, var.lxc_subnet_mask)
  }
}