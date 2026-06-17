data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_iam_role" "github_actions_deploy" {
  name = "GitHubActionsDeployRole"
}

data "aws_iam_role" "developer_admin" {
  name = "DeveloperAdminRole"
}