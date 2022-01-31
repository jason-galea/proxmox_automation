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
  pm_password = file("../password.txt")
}

### TODO: Check if CT image exists, if not then download most recent ubuntu template:
# pveam update
# pveam available | grep ubuntu | awk '{print $2}' | sort | tail -n 1 | xargs pveam download local

### TODO:
# If base template (CT200) exists
  # Deploy CT200
  # Configure as per configure.yml, but no unique user
# Deploy from template

resource "proxmox_lxc" "basic" {
  for_each        = var.lxc_info

  target_node     = "prox"
  vmid            = each.value.id
  ostemplate      = "local:vztmpl/ubuntu-21.10-standard_21.10-1_amd64.tar.zst"
  ostype          = "ubuntu"
  hostname        = each.key
  password        = file("../password.txt")
  ssh_public_keys = file("~/.ssh/id_rsa.pub") # Add localhost SSH key
  cores           = try(each.value.cores, 1)
  memory          = try(each.value.memory, 100) # MB
  swap            = try(each.value.swap, 100) # MB
  unprivileged    = true
  start           = true
  onboot          = true
  # nameserver      = # Blank nameserver --> Match prox --> 172.26.0.1 --> OPNsense
  # nameserver      = format("%s%s", var.lxc_network, var.lxc_info.pihole.id) # 172.26.0.161
  # nameserver      = "1.1.1.1"
  features {
    nesting = try(each.value.f_nesting, false)
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    # ip     = "dhcp"
    ip     = format("%s%s/24", var.lxc_network, each.value.id)
    # ip     = var.lxc_network + each.value.id + "/24"
    gw     = format("%s1", var.lxc_network)
  }
  rootfs { # Terraform will crash without rootfs defined
    storage = "local-lvm"
    size    = "8G"
  }
}