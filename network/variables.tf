variable vpc_id {
  type = string
}

variable subnet_ids {
  type = list(string)
}

variable network {
  description = "v1: network"
  type = object({
    name           = string
    subdomain      = string
    domain         = string
    cert_domain    = string
    backend_port   = string
    logging_bucket = string
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