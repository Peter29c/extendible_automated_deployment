# resource "aws_eks_access_entry" "github_deploy" {
#   cluster_name  = aws_eks_cluster.this.name
#   principal_arn = var.github_deploy_role_arn
#   type          = "STANDARD"
# }

# resource "aws_eks_access_policy_association" "github_deploy_admin" {
#   cluster_name  = aws_eks_cluster.this.name
#   principal_arn = var.github_deploy_role_arn

#   policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

#   access_scope {
#     type = "cluster"
#   }
# }

# resource "aws_eks_access_entry" "developer_admin" {
#   cluster_name  = aws_eks_cluster.this.name
#   principal_arn = var.developer_admin_role_arn
#   type          = "STANDARD"
# }

# resource "aws_eks_access_policy_association" "developer_admin_policy" {
#   cluster_name  = aws_eks_cluster.this.name
#   principal_arn = var.developer_admin_role_arn

#   policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

#   access_scope {
#     type = "cluster"
#   }
# }