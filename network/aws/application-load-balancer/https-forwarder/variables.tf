# Required, Forces New Resource
variable load_balancer_arn {
  description = "(Required, Forces New Resource) The ARN of the load balancer."
  type        = string
}

# Required, Forces New Resource
variable certificate_arn {
  description = "(Required) The ARN of the certificate to attach to the listener."
  type        = string
}

# Required
variable target_group_arn {
  description = "(Required) The ARN of the Target Group to which to route traffic."
  type        = string
}