resource aws_elasticache_cluster this {
  cluster_id           = var.cluster_id
  replication_group_id = var.replication_group_id
  tags                 = var.tags
}
