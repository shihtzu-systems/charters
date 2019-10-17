variable vpc_id {
  type = string
}

variable redis_subnet_group_name {
  type = string
}

variable storage {
  description = "storage.v3"
  type = object({
    name            = string
    bucket_name     = string
    redis_name      = string
    redis_node_type = string
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
