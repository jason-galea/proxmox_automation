# TODO:
# - Multiple CTs with different configurations

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      # version = "2.9.4" # Latest release: https://github.com/Telmate/terraform-provider-proxmox/releases
      version = "2.8.0" # Workaround for https://github.com/Telmate/terraform-provider-proxmox/issues/480
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

  target_node     = "prox"
  vmid            = each.value.id
  ostemplate      = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  ostype          = "ubuntu"
  hostname        = each.key
  password        = file("password.txt")
  ssh_public_keys = file("~/.ssh/id_rsa.pub") # Add localhost SSH key
  cores           = try(each.value.cores, 2)
  memory          = try(each.value.memory, 512)
  swap            = try(each.value.swap, 100)
  unprivileged    = true
  start           = true
  onboot          = true

  network {
    name   = "eth0"
    bridge = "vmbr0"
    # ip     = "dhcp"
    ip     = format("%s%s/24", var.lxc_network, each.value.id)
    # ip     = var.lxc_network + each.value.id + "/24"
  }

  rootfs { # Terraform will crash without rootfs defined
    storage = "local-lvm"
    size    = "8G"
  }
}