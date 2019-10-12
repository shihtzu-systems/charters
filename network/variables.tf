variable network {
  description = "v1: network"
  type = object({
    name           = string
    subnet_ids     = list(string)
    subdomain      = string
    domain         = string
    cert_domain    = string
    backend_port   = string
    logging_bucket = string
    vpc_id         = string
    subnet_ids     = list(string)
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