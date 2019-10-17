variable compute {
  description = "compute.v1"
  type = object({
    name            = string
    region_name     = string
    network_address = string
  })
}
