resource "aws_ecr_repository" "ead-api" {
  name                 = var.project_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  /* tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  } */
}