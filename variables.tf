variable "cluster_arn" {
  description = "ARN of the ECS cluster"
  type        = string
  validation {
    condition     = length(var.cluster_arn) > 0
    error_message = "cluster_arn must not be empty."
  }
}

variable "task_definition_arn" {
  description = "ARN of the task definition"
  type        = string
  validation {
    condition     = length(var.task_definition_arn) > 0
    error_message = "task_definition_arn must not be empty."
  }
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
  default     = 1
}

variable "launch_type" {
  description = "Launch type (FARGATE, EC2)"
  type        = string
  default     = "FARGATE"
}

variable "capacity_provider_strategy" {
  description = "Capacity provider strategy (overrides launch_type)"
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = optional(number, 0)
  }))
  default = null
}

variable "network_mode" {
  description = "Network mode of the task definition"
  type        = string
  default     = "awsvpc"
}

variable "subnet_ids" {
  description = "Subnet IDs for awsvpc network mode"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs for awsvpc network mode"
  type        = list(string)
  default     = []
}

variable "assign_public_ip" {
  description = "Assign public IP (Fargate)"
  type        = bool
  default     = false
}

variable "load_balancer_config" {
  description = "Load balancer configuration"
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })
  default = null
}

variable "deployment_minimum_healthy_percent" {
  description = "Minimum healthy percent during deployment"
  type        = number
  default     = 100
}

variable "deployment_maximum_percent" {
  description = "Maximum percent during deployment"
  type        = number
  default     = 200
}

variable "health_check_grace_period_seconds" {
  description = "Health check grace period (only with LB)"
  type        = number
  default     = null
}

variable "enable_execute_command" {
  description = "Enable ECS Exec"
  type        = bool
  default     = false
}

variable "force_new_deployment" {
  description = "Force new deployment"
  type        = bool
  default     = false
}

variable "deployment_circuit_breaker_enabled" {
  description = "Enable deployment circuit breaker"
  type        = bool
  default     = true
}

variable "deployment_circuit_breaker_rollback" {
  description = "Enable rollback on circuit breaker"
  type        = bool
  default     = true
}
