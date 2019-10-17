resource aws_elasticache_cluster this {
  cluster_id                   = var.cluster_id
  engine                       = var.engine
  engine_version               = var.engine_version
  maintenance_window           = var.maintenance_window
  node_type                    = var.node_type
  num_cache_nodes              = var.num_cache_nodes
  parameter_group_name         = var.parameter_group_name
  port                         = var.port
  subnet_group_name            = var.subnet_group_name
  security_group_names         = var.security_group_names
  security_group_ids           = var.security_group_ids
  apply_immediately            = var.apply_immediately
  snapshot_arns                = var.snapshot_arns
  snapshot_name                = var.snapshot_name
  snapshot_window              = var.snapshot_window
  snapshot_retention_limit     = var.snapshot_retention_limit
  notification_topic_arn       = var.notification_topic_arn
  az_mode                      = var.az_mode
  availability_zone            = var.availability_zone
  preferred_availability_zones = var.preferred_availability_zones
  tags                         = var.tags
}
