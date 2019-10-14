variable cluster_id {
  type = string
}
variable node_type {
  type = string
  default = "cache.m4.large"
}
variable num_cache_nodes {
  type = number
  default = 2
}
variable parameter_group_name {
  type = string
  default = "default.memcached1.4"
}
variable port {
  type = number
  default = 11211
}

module redis {
  source = "../"

  cluster_id = var.cluster_id
  engine = "memcached"
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port = var.port
}

// resource "aws_elasticache_cluster" "example" {
//  cluster_id           = "cluster-example"
//  engine               = ""
//  node_type            = ""
//  num_cache_nodes      = 2
//  parameter_group_name = ""
//  port                 = 11211
//}