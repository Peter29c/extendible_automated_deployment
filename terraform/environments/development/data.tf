data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_iam_role" "github_deploy" {
  name = var.github_deploy_role_name
}

# TODO: missing "aws_iam_role" "github_actions_terraform"?

data "aws_iam_role" "developer_admin" {
  name = var.developer_admin_role_name
}

data "aws_iam_role" "observability" {
  name = var.observability_role_name
}

data "aws_iam_role" "adot" {
  name = var.adot_role_name
}