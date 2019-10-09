variable name {
  description = "Name of the networking stuff"
}

variable vpc {
  description = "v1: vpc info"
  type = object({
    vpc_id            = string
    network_address   = string
    public_subnet_ids = list(string)
  })
}
