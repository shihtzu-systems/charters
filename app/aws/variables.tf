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
  description = "app.v2"
  type = object({
    name              = string
    group             = string
    git_url           = string
    archive_url       = string
    pre_init_commands = list(string)
    command           = string
    packages          = list(string)
    whitelist_ip      = string
    key_pair_name     = string
  })
}

variable compute {
  description = "compute.v1"
  type = object({
    name            = string
    region_name     = string
    network_address = string
  })
}
