# resource "aws_eks_cluster" "this" {
#   name     = var.cluster_name
#   role_arn = aws_iam_role.cluster.arn

#   access_config {
#     authentication_mode = "API"
#   }

#   vpc_config {
#     subnet_ids = var.subnet_ids
#   }

#   tags = var.tags

#   depends_on = [
#     aws_iam_role_policy_attachment.cluster_policy
#   ]
# }

# # it generates a EC2 Auto Scaling Group (each ec2 machine is a worker node)
# resource "aws_eks_node_group" "default" {
#   cluster_name    = aws_eks_cluster.this.name
#   node_group_name = "default"

#   node_role_arn = aws_iam_role.node.arn
#   subnet_ids    = var.subnet_ids

#   scaling_config {
#     desired_size = var.node_desired_size
#     min_size     = var.node_min_size
#     max_size     = var.node_max_size
#   }

#   instance_types = var.node_instance_types

#   tags = var.tags

#   depends_on = [
#     aws_iam_role_policy_attachment.worker_node_policy,
#     aws_iam_role_policy_attachment.cni_policy,
#     aws_iam_role_policy_attachment.ecr_readonly
#   ]
# }