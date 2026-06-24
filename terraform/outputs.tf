# for github actions usage
output "ecr_repository_url" {
  value = aws_ecr_repository.ead-api.repository_url
}

output "cluster_name" {
  value = aws_eks_cluster.main.name
}