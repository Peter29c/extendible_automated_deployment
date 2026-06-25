resource "aws_iam_role_policy_attachment" "cloudwatch" {
  count = var.enable_cloudwatch_observability ? 1 : 0

  role       = var.observability_role_name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "adot" {
  count = var.enable_adot ? 1 : 0

  role       = var.adot_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
}

resource "aws_prometheus_workspace" "this" {
  count = var.enable_amp ? 1 : 0

  alias = "ead-${var.environment}-api"
}

resource "aws_eks_pod_identity_association" "observability" {
  count = var.enable_cloudwatch_observability ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "amazon-cloudwatch"
  service_account = "cloudwatch-agent"
  role_arn        = var.observability_role_arn
}

resource "aws_eks_addon" "observability" {
  count = var.enable_cloudwatch_observability ? 1 : 0

  cluster_name = var.cluster_name
  addon_name   = "amazon-cloudwatch-observability"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_pod_identity_association.observability
  ]
}

resource "aws_eks_addon" "cert_manager" {
  count = var.enable_adot ? 1 : 0

  cluster_name = var.cluster_name
  addon_name   = "cert-manager"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_pod_identity_association" "adot" {
  count = var.enable_adot ? 1 : 0

  cluster_name    = var.cluster_name
  namespace       = "opentelemetry-operator-system"
  service_account = "adot-collector"
  role_arn        = var.adot_role_arn
}

resource "aws_eks_addon" "adot" {
  count = var.enable_adot ? 1 : 0

  cluster_name = var.cluster_name
  addon_name   = "adot"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [
    aws_eks_addon.cert_manager,
    aws_eks_pod_identity_association.adot
  ]
}