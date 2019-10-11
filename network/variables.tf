variable name {
  description = "Name of the networking stuff"
}

variable subdomain {
  description = "The DNS subdomain to use"
}

variable domain {
  description = "The DNS domain to use"
}

variable cert_domain {
  description = "The domain of the cert to look up"
}

variable vpc {
  description = "v1: vpc info"
  type = object({
    vpc_id            = string
    network_address   = string
    public_subnet_ids = list(string)
  })
}

variable backend_port {
  description = "The port of the backend app being targeted"
  default     = "8080"
}