output "cluster_name" {
  value = aws_ecs_cluster.this.name
}

output "service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition_family" {
  value = aws_ecs_task_definition.app.family
}

output "ecs_instance_public_ip" {
  value = aws_instance.ecs.public_ip
}

output "application_url" {
  value = "http://${aws_instance.ecs.public_ip}:${var.container_port}"
}