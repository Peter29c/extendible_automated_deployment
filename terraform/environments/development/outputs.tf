output "environment" {
  value = var.environment
}

# output "cluster_name" {
#   value = module.eks.cluster_name
# }

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecr_repository_name" {
  value = module.ecr.repository_name
}