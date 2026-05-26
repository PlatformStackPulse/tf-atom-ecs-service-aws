output "id" {
  description = "ID of the ECS service"
  value       = try(aws_ecs_service.this[0].id, null)
}

output "name" {
  description = "Name of the ECS service"
  value       = try(aws_ecs_service.this[0].name, null)
}

output "cluster" {
  description = "Cluster ARN the service runs on"
  value       = try(aws_ecs_service.this[0].cluster, null)
}
