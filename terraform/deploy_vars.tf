variable "lxc_network" {
  default     = "172.26.0."
}

variable "lxc_info" {
  type        = map
  default     = {
    # portainer = {
    #   id      = "160",
    #   cores   = 4
    #   memory  = 4096
    #   swap    = 512
    #   features  = "nesting"
    # },
    pihole = {
      id        = "161",
      # dns       = "127.0.0.1",
      features  = {
        nesting   = true
      }
    },
    apache = {
      id      = "162",
    },
    # emby = {
    #   id      = "163",
    #   cores   = 2
    #   memory  = 1024
    # },
    # wekan = {
    #   id      = "164",
    # }
  }
}

