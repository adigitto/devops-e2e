variable "region" {
  type    = string
  default = "us-west-1"
}

variable "aws_profile" {
  type    = string
  default = "adi-tf"
}

variable "cluster_name" {
  type    = string
  default = "eks-test-cluster"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version; verify standard support before deployment."
  type        = string
  default     = "1.35"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "Public IPv4 addresses allowed to reach the EKS API. Update when your public IP changes."
  type        = list(string)
  default     = ["98.255.42.242/32"]

  validation {
    condition = length(var.cluster_endpoint_public_access_cidrs) > 0 && alltrue([
      for cidr in var.cluster_endpoint_public_access_cidrs : can(cidrnetmask(cidr)) && endswith(cidr, "/32")
    ])
    error_message = "Specify at least one IPv4 address with a /32 prefix."
  }
}
