# EKS GitOps demo

## Next steps

1. Build and locally test the Docker images in `app/frontend` and `app/backend`.
2. Obtain repository URLs with `terraform output -raw frontend_repository_url` and `terraform output -raw backend_repository_url`.
3. Authenticate Docker to ECR using the same AWS profile, tag images with unique versions, and push them.
4. Add Kubernetes Deployments, Services, resource requests, and probes.
5. Configure frontend `/api/data` routing to the backend through a proxy or ingress.
6. Install a GitOps controller and connect it to the manifests directory.

The application manifests and GitOps controller are not installed by this Terraform configuration.
