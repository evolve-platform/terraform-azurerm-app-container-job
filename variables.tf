variable "name" {
  description = "The name of the container"
  type        = string
}

variable "cpu" {
  description = "The CPU to be used for the container"
  type        = number
  default     = 0.25
}

variable "memory" {
  description = "The memory to be used for the container"
  type        = string
  default     = "0.5Gi"
}

variable "env_vars" {
  description = "Environment variables to be set in the container"
  type        = map(string)
  default     = {}
}

variable "image" {
  description = "The image to be used for the container"
  type        = string
}

variable "identity_id" {
  description = "The identity to be used for the container"
  type        = string
}

variable "container_app_environment_id" {
  description = "The container app environment to be used for the container"
  type        = string
}

variable "resource_group_name" {
  description = "The resource group to be used for the container"
  type        = string
}

variable "resource_group_location" {
  description = "The resource group location to be used for the container"
  type        = string
}

variable "secrets" {
  type = list(object({
    secret_id   = string
    secret_name = string
    env_name    = string
  }))
  default = []
}

variable "replica_timeout_in_seconds" {
  description = "The maximum number of seconds a replica is allowed to run."
  type        = number
  default     = 600
}

variable "container_port" {
  description = "The port the container listens on"
  type        = number
  default     = 4000
}

variable "healthcheck" {
  type = object({
    path                = string
    unhealthy_threshold = number
    timeout             = number
    interval            = number
  })
  default = {
    path                = "/"
    unhealthy_threshold = 3
    timeout             = 2
    interval            = 5
  }
  description = "Healthcheck configuration"
}

variable "tags" {
  description = "Tags to be set on the container"
  type        = map(string)
  default     = {}
}

variable "manual_trigger_config" {
  description = "Configuration for manual trigger. Either this or schedule_trigger_config must be set."
  type = object({
    parallelism              = optional(number, 1)
    replica_completion_count = optional(number, 1)
  })
  default = null
}

variable "schedule_trigger_config" {
  description = "Configuration for scheduled trigger. Either this or manual_trigger_config must be set."
  type = object({
    cron_expression          = string
    parallelism              = optional(number, 1)
    replica_completion_count = optional(number, 1)
  })
  default = null
}
