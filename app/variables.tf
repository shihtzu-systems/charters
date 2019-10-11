variable name {
  description = "Name of the app"
  type        = string
}

variable group {
  description = "Name of the group"
  type        = string
}

variable git_url {
  description = "The git url to the project"
  type        = string
}

variable pre_init_commands {
  description = "The commands to run directly before init.sh"
  type        = list(string)
  default     = []
}

variable command {
  description = "The command args to pass when starting the app"
  type        = string
}

variable packages {
  description = "The apt packages to install"
  type        = list(string)
  default     = ["make"]
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
  type        = string
}

variable key_pair_name {
  description = "Name of the key-pair to use"
  type        = string
}

variable config_content {
  description = "The content of the config"
  type        = string
  default     = ""
}
