resource "aws_security_group" "ecs_instance" {
  name        = "${var.project_name}-${var.environment}-ecs-instance-sg"
  description = "Development ECS EC2 instance security group"
  vpc_id      = var.vpc_id

  ingress {
    description = "Application HTTP port"
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidr_blocks
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}