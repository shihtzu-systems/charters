variable region {
  description = "AWS Region"
  default     = "us-west-2"
}

variable region_name {
  description = "Name of the region"
}

variable vpc_network_address {
  description = "The CIDR block for the vpc"
}

variable cluster_name {
  description = "Name of the kubernetes cluster"
}
