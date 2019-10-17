variable cluster_id {
  type = string
}
variable node_type {
  type    = string
  default = "cache.m4.large"
}
variable num_cache_nodes {
  type    = number
  default = 2
}
variable parameter_group_name {
  type    = string
  default = "default.memcached1.4"
}
variable port {
  type    = number
  default = 11211
}
variable subnet_group_name {
  type = string
}
variable security_group_ids {
  type = list(string)
}
variable tags {
  type    = map(string)
  default = {}
}

module redis {
  source = ".."

  cluster_id           = var.cluster_id
  engine               = "memcached"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = var.subnet_group_name
  security_group_ids   = var.security_group_ids
  tags                 = var.tags
}