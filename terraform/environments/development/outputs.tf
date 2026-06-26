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

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "application_url" {
  value = module.ecs.application_url
}