resource "helm_release" "karpenter_provisioner" {
  name    = var.karpenter_config.provisioner_name
  chart   = "${path.module}/karpenter_provisioner/"
  timeout = 600
  values = [
    templatefile("${path.module}/karpenter_provisioner/values.yaml", {
      provisioner_name       = var.karpenter_config.provisioner_name,
      private_subnet_name    = var.karpenter_config.private_subnet_name,
      cluster_name           = var.cluster_name,
      instance_capacity_type = "[${join(",", [for s in var.karpenter_config.instance_capacity_type : format("%s", s)])}]",
      excluded_instance_type = "[${join(",", var.karpenter_config.excluded_instance_type)}]"
    }),
    var.karpenter_config.provisioner_values
  ]
}
