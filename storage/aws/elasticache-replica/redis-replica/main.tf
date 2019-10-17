variable cluster_id {
  type = string
}
variable replication_group_id {
  type = string
}
variable tags {
  type    = map(string)
  default = {}
}

module redis_replica {
  source = ".."

  cluster_id           = var.cluster_id
  replication_group_id = var.replication_group_id
  tags                 = var.tags
}