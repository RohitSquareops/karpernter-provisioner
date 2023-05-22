variable "karpenter_config" {
  description = "value"
  type        = any
  default = {
    provisioner_name       = ""
    provisioner_values     = ""
    private_subnet_name    = ""
    instance_capacity_type = [""]
    excluded_instance_type = [""]
  }
}

variable "cluster_name" {
  description = "value"
  type        = string
  default     = ""
}
