resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.name
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port

  maintenance_window = var.mai
}