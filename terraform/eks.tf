module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_private_access      = true
  endpoint_public_access       = true
  endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

  # Allow the Terraform caller to administer the cluster using the same AWS profile.
  enable_cluster_creator_admin_permissions = true

  # v21 renames this from "cluster_addons" to "addons"
  addons = {
    vpc-cni = {
      before_compute              = true
      resolve_conflicts_on_create = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflicts_on_create = "OVERWRITE"
    }
    coredns = {
      resolve_conflicts_on_create = "OVERWRITE"
    }
  }

  eks_managed_node_groups = {
    general = {
      use_latest_ami_release_version = false
      ami_type                       = "AL2023_x86_64_STANDARD"
      desired_size                   = 2
      min_size                       = 1
      max_size                       = 3
      instance_types                 = ["t3.medium"]
      capacity_type                  = "ON_DEMAND"
    }
  }
}
