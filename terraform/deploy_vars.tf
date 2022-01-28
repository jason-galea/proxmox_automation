variable "lxc_network" {
  default     = "172.26.0."
}

variable "lxc_info" {
  type        = map
  default     = {
    pihole = {
      id      = "161",
    },
    apache = {
      id      = "162",
    },
    emby = {
      id      = "163",
      cores   = 4
      memory  = 2048
    },
    wekan = {
      id      = "164",
    }
  }
}

