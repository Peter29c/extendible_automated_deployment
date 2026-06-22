resource "aws_eks_cluster" "main" {
  name     = "ead-api-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  access_config {
    authentication_mode = "API"
  }

  vpc_config {
    subnet_ids = data.aws_subnets.default.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "default"

  node_role_arn = aws_iam_role.eks_node_role.arn

  subnet_ids = data.aws_subnets.default.ids

  scaling_config {
    desired_size = 3
    min_size     = 2
    max_size     = 4
  }

  instance_types = ["t3.small"]

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_readonly
  ]
}