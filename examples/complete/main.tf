locals {
  provisioner_name = "management-provsioner" ## unique provisioner name across cluster
  region           = "us-east-2"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "provisioner" {
  source       = "../../"
  cluster_name = "dev-skaf"
  karpenter_config = {
    provisioner_name       = local.provisioner_name
    provisioner_values     = file("./helm/karpenter.yaml")
    private_subnet_name    = "dev-skaf-private-subnet"
    instance_capacity_type = ["spot"]
    excluded_instance_type = ["nano", "micro", "small"]
  }

}
