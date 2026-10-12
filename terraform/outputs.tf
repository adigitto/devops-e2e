output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "configure_kubectl" {
  description = "Run this command to configure kubectl locally"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name} --profile ${var.aws_profile}"
}

output "frontend_repository_url" {
  description = "ECR URL for tagging and pushing the frontend image"
  value       = aws_ecr_repository.frontend.repository_url
}

output "backend_repository_url" {
  description = "ECR URL for tagging and pushing the backend image"
  value       = aws_ecr_repository.backend.repository_url
}
