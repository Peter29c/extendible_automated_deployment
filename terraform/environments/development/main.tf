locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = var.repository_name
  environment     = var.environment
  tags            = local.common_tags
}

module "ecs" {
  source = "../../modules/ecs"

  project_name = var.project_name
  environment  = var.environment

  cluster_name = var.cluster_name
  service_name = var.service_name

  container_name = var.container_name
  container_port = var.container_port

  image_uri = "${module.ecr.repository_url}:latest"

  vpc_id    = data.aws_vpc.default.id
  subnet_id = data.aws_subnets.default.ids[0]

  instance_type = var.instance_type

  cpu    = var.cpu
  memory = var.memory

  allowed_ingress_cidr_blocks = var.allowed_ingress_cidr_blocks

  tags = local.common_tags
}

# module "eks" {
#   source = "../../modules/eks"

#   project_name = var.project_name
#   environment  = var.environment
#   cluster_name = var.cluster_name

#   subnet_ids = data.aws_subnets.default.ids

#   node_instance_types = var.node_instance_types
#   node_desired_size   = var.node_desired_size
#   node_min_size       = var.node_min_size
#   node_max_size       = var.node_max_size

#   github_deploy_role_arn   = data.aws_iam_role.github_deploy.arn
#   developer_admin_role_arn = data.aws_iam_role.developer_admin.arn

#   tags = local.common_tags

#   enable_eks_cluster    = var.enable_eks_cluster
#   enable_eks_node_group = var.enable_eks_node_group
# }

# module "observability" {
#   source = "../../modules/observability"

#   cluster_name = module.eks.cluster_name
#   environment  = var.environment

#   observability_role_arn  = data.aws_iam_role.observability.arn
#   observability_role_name = data.aws_iam_role.observability.name

#   adot_role_arn  = data.aws_iam_role.adot.arn
#   adot_role_name = data.aws_iam_role.adot.name

#   enable_adot                     = var.enable_adot
#   enable_cloudwatch_observability = var.enable_cloudwatch_observability
#   enable_amp                      = var.enable_amp
# }