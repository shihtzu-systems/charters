variable vpc_id {
  type = string
}

variable redis_subnet_group_name {
  type = string
}

variable storage {
  description = "v3: storage"
  type = object({
    name            = string
    bucket_name     = string
    redis_name      = string
    redis_node_type = string
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
