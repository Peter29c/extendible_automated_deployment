output "prometheus_workspace_id" {
  value = try(aws_prometheus_workspace.this[0].id, null)
}