data "aws_vpc" "default" {
  default = true
}

# TODO: change to custom VPC for prod
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_iam_role" "github_actions_deploy" {
  name = "GitHubActionsDeployRole"
}

data "aws_iam_role" "github_actions_terraform" {
  name = "GitHubActionsTerraformRole"
}

data "aws_iam_role" "developer_admin" {
  name = "DeveloperAdminRole"
}

data "aws_iam_role" "amazon_eks_observability_role" {
  name = "AmazonEKSObservabilityRole"
}

data "aws_iam_role" "amazon_eks_adot_role" {
  name = "AmazonEKSADOTRole"
}