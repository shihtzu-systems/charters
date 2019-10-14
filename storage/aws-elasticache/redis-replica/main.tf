variable cluster_id {
  type = string
}
variable replication_group_id {
  type = string
}

variable security_group_ids {
  type = list(string)
}

module redis_replica {
  source = "../"

  cluster_id = var.cluster_id
  replication_group_id = var.replication_group_id

  security_group_ids = var.security_group_ids
}