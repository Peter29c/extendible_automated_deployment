resource "aws_eks_access_entry" "github_deploy_role" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = data.aws_iam_role.github_actions_deploy.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "github_deploy_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = data.aws_iam_role.github_actions_deploy.arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}

resource "aws_eks_access_entry" "developer_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = data.aws_iam_role.developer_admin.arn

  type = "STANDARD"
}

resource "aws_eks_access_policy_association" "developer_admin_policy" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = data.aws_iam_role.developer_admin.arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}