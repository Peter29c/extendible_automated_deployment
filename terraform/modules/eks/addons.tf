# resource "aws_eks_addon" "pod_identity_agent" {
#   cluster_name = aws_eks_cluster.this.name
#   addon_name   = "eks-pod-identity-agent"

#   resolve_conflicts_on_create = "OVERWRITE"
#   resolve_conflicts_on_update = "OVERWRITE"
# }