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
    vpc_id            = string
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
