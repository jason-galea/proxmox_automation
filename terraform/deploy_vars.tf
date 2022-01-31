variable "lxc_network" {
  default     = "172.26.0."
}

variable "lxc_info" {
  type        = map
  default     = {
    # portainer = {
    #   id          = "160",
    #   cores       = 4
    #   memory      = 4096
    #   swap        = 512
    #   f_nesting   = true
    # },
    pihole = {
      id          = "161",
      f_nesting   = true
    },
    apache = {
      id          = "162",
    },
    # emby = {
    #   id        = "163",
    #   cores     = 2
    #   memory    = 1024
    # },
    # wekan = {
    #   id        = "164",
    # }
  }
}
