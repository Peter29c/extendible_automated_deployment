variable "aws_region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "repository_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "cpu" {
  type    = number
  default = 128
}

variable "memory" {
  type    = number
  default = 256
}

variable "allowed_ingress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# variable "tags" {
#   type    = map(string)
#   default = {}
# }

# variable "desired_capacity" {
#   type    = number
#   default = 1
# }

# variable "min_size" {
#   type    = number
#   default = 1
# }

# variable "max_size" {
#   type    = number
#   default = 1
# }

# variable "log_retention_days" {
#   type    = number
#   default = 1
# }

# variable "node_instance_types" {
#   type = list(string)
# }

# variable "node_desired_size" {
#   type = number
# }

# variable "node_min_size" {
#   type = number
# }

# variable "node_max_size" {
#   type = number
# }

# variable "github_deploy_role_name" {
#   type = string
# }

# variable "developer_admin_role_name" {
#   type = string
# }

# variable "observability_role_name" {
#   type = string
# }

# variable "adot_role_name" {
#   type = string
# }

# variable "enable_adot" {
#   type = bool
# }

# variable "enable_cloudwatch_observability" {
#   type = bool
# }

# variable "enable_amp" {
#   type = bool
# }