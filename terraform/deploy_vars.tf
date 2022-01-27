variable "lxc_network" {
  default     = "172.26.0."
}

variable "lxc_subnet_mask" {
  default     = "24"
}

variable "lxc_info" {
  # description = "Map of project names to configuration."
  type        = map
  default     = {
    pihole = {
      id      = "161",
      # port    = "80",
      user    = "pihole"
    },
    apache = {
      id      = "162",
      # port    = "80",
      user    = "apache"
    },
    emby = {
      id      = "163",
      # port    = "8096",
      user    = "emby"
    },
    wekan = {
      id      = "164",
      # port    = "3001",
      user    = "wekan"
    }
  }
}
