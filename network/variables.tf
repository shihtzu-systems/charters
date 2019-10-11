variable name {
  description = "Name of the networking stuff"
}

variable cert_arn {
  description = "The ARN of the cert to use for https"
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
  default = "8080"
}