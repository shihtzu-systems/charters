variable vpc_id {
  type = string
}

variable subnet_ids {
  type = list(string)
}

variable instance_id {
  type = string
}

variable network {
  description = "network.v1"
  type = object({
    name         = string
    subdomain    = string
    domain       = string
    cert_domain  = string
    backend_port = string
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