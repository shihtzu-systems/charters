variable config_content {
  type = string
}

variable vpc_id {
  type = string
}

variable subnet_ids {
  type = list(string)
}

variable app {
  description = "v1: app"
  type = object({
    name              = string
    group             = string
    git_url           = string
    pre_init_commands = list(string)
    command           = string
    packages          = list(string)
    whitelist_ip      = string
    key_pair_name     = string
    config_content    = string
  })
}

variable compute {
  description = "v1: compute"
  type = object({
    name            = string
    region_name     = string
    network_address = string
  })
}
