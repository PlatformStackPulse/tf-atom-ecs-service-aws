# tf-atom-ecs-service-aws

[![CI](https://github.com/PlatformStackPulse/tf-atom-ecs-service-aws/actions/workflows/ci.yml/badge.svg)](https://github.com/PlatformStackPulse/tf-atom-ecs-service-aws/actions/workflows/ci.yml)
![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.6.0-blueviolet)

## Purpose

ECS service for running and maintaining tasks with load balancing and auto-scaling support.

## Module Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | git::https://github.com/PlatformStackPulse/tf-label.git | v1.0.0 |

### Resources

| Name | Type |
|------|------|
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_arn"></a> [cluster\_arn](#input\_cluster\_arn) | ARN of the ECS cluster | `string` | n/a | yes |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | ARN of the task definition | `string` | n/a | yes |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign public IP (Fargate) | `bool` | `false` | no |
| <a name="input_capacity_provider_strategy"></a> [capacity\_provider\_strategy](#input\_capacity\_provider\_strategy) | Capacity provider strategy (overrides launch\_type) | <pre>list(object({<br/>    capacity_provider = string<br/>    weight            = number<br/>    base              = optional(number, 0)<br/>  }))</pre> | `null` | no |
| <a name="input_deployment_circuit_breaker_enabled"></a> [deployment\_circuit\_breaker\_enabled](#input\_deployment\_circuit\_breaker\_enabled) | Enable deployment circuit breaker | `bool` | `true` | no |
| <a name="input_deployment_circuit_breaker_rollback"></a> [deployment\_circuit\_breaker\_rollback](#input\_deployment\_circuit\_breaker\_rollback) | Enable rollback on circuit breaker | `bool` | `true` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | Maximum percent during deployment | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | Minimum healthy percent during deployment | `number` | `100` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Desired number of tasks | `number` | `1` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Enable ECS Exec | `bool` | `false` | no |
| <a name="input_force_new_deployment"></a> [force\_new\_deployment](#input\_force\_new\_deployment) | Force new deployment | `bool` | `false` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Health check grace period (only with LB) | `number` | `null` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | Launch type (FARGATE, EC2) | `string` | `"FARGATE"` | no |
| <a name="input_load_balancer_config"></a> [load\_balancer\_config](#input\_load\_balancer\_config) | Load balancer configuration | <pre>object({<br/>    target_group_arn = string<br/>    container_name   = string<br/>    container_port   = number<br/>  })</pre> | `null` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Network mode of the task definition | `string` | `"awsvpc"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs for awsvpc network mode | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs for awsvpc network mode | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | Cluster ARN the service runs on |
| <a name="output_id"></a> [id](#output\_id) | ID of the ECS service |
| <a name="output_name"></a> [name](#output\_name) | Name of the ECS service |
<!-- END_TF_DOCS -->
