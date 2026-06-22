resource "aws_eks_pod_identity_association" "observability" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "amazon-cloudwatch"
  service_account = "cloudwatch-agent"

  role_arn = data.aws_iam_role.amazon_eks_observability_role.arn
}

resource "aws_eks_addon" "observability" {
  cluster_name = aws_eks_cluster.main.name
  addon_name = "amazon-cloudwatch-observability"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_pod_identity_association.observability
  ]
}