variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_instance_types" {
  type = list(string)
}

variable "node_desired_size" {
  type = number
}

variable "node_min_size" {
  type = number
}

variable "node_max_size" {
  type = number
}

variable "github_deploy_role_arn" {
  type = string
}

variable "developer_admin_role_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}