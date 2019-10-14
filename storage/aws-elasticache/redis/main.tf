variable cluster_id {
  type = string
}
variable node_type {
  type = string
  default = "cache.m4.large"
}
variable parameter_group_name {
  type = string
  default = "default.redis3.2"
}
variable engine_version {
  type = string
  default = "3.2.10"
}
variable port {
  type = number
  default = 6379
}

module redis {
  source = "../"

  cluster_id = var.cluster_id
  engine = "redis"
  node_type = var.node_type
  num_cache_nodes = 1
  parameter_group_name = var.parameter_group_name
  engine_version = var.engine_version
  port = var.port
}