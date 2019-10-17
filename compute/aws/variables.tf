variable compute {
  description = "v1: compute"
  type = object({
    name            = string
    region_name     = string
    network_address = string
  })
}
