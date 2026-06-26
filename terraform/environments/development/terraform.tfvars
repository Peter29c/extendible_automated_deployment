aws_region   = "us-east-2"
project_name = "ead-api"
environment  = "development"

repository_name = "ead/development/ead-api"

# ECS
cluster_name    = "ead-api-development-ecs-cluster"
service_name    = "ead-development-api"

container_name = "ead-api"
container_port = 3000

instance_type = "t3.micro"

cpu    = 128
memory = 256

allowed_ingress_cidr_blocks = [ "0.0.0.0/0" ]

# EKS
# node_instance_types = ["t3.small"]
# node_desired_size   = 3
# node_min_size       = 2
# node_max_size       = 4

# github_deploy_role_name   = "GitHubActionsDeployRole"
# developer_admin_role_name = "DeveloperAdminRole"

# observability_role_name = "AmazonEKSObservabilityRole"
# adot_role_name          = "AmazonEKSADOTRole"

# enable_adot                     = false
# enable_cloudwatch_observability = false
# enable_amp                      = false