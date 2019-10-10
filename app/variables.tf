variable name {
  description = "Name of the app"
}

variable group {
  description = "Name of the group"
}

variable gitUrl {
  description = "The git url to the project"
}

variable command {
  description = "The command args to pass when starting the app"
}

variable envs {
  description = "v1: envs"
  type = list(object({
    key = string
    value = string
  }))
}

variable packages {
  description = "The apt packages to install"
  type = list(string)
  default = [ "make" ]
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
