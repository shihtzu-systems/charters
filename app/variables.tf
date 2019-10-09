variable name {
  description = "Name of the app"
}

variable envs {
  description = "v1: envs"
  type = list(object({
    key = string
    value = string
  }))
}

variable vpc {
  description = "v1: vpc"
  type = object({
    vpc_id            = string
    network_address   = string
    public_subnet_ids = list(string)
  })
}

variable whitelist_ip {
  description = "The ip to allow admin access"
}

variable key_pair_name {
  description = "Name of the key-pair to use"
}
