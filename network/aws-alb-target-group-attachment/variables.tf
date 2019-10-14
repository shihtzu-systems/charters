# Required
variable target_group_arn {
  description = "(Required) The ARN of the target group with which to register targets."
  type        = string
}

# Required
# - This is the Instance ID for an instance
variable target_id {
  description = "(Required) The ID of the target."
  type        = string
}

# Optional
variable port {
  description = "(Optional) The port on which targets receive traffic."
  type        = number
}

# Optional
variable availability_zone {
  description = "(Optional) The Availability Zone where the IP address of the target is to be registered."
  type        = string
  default     = ""
}