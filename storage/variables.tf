variable vpc_id {
  type = string
}

variable subnet_group_name {
  type = string
}

variable storage {
  description = "v2: storage"
  type = object({
    name        = string
    bucket_name = string
    redis_name  = string
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
