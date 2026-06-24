resource "aws_eks_addon" "cert_manager" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "cert-manager"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_pod_identity_association" "adot" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "opentelemetry-operator-system"
  service_account = "adot-collector"

  role_arn = data.aws_iam_role.amazon_eks_adot_role.arn
}

resource "aws_eks_addon" "adot" {
  cluster_name = aws_eks_cluster.main.name
  addon_name   = "adot"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_addon.cert_manager,
    aws_eks_pod_identity_association.adot
  ]
}