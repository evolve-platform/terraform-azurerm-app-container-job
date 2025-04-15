resource "azurerm_container_app_job" "this" {
  name                         = var.name
  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = var.resource_group_name
  workload_profile_name        = "Consumption"
  replica_timeout_in_seconds   = var.replica_timeout_in_seconds
  location                     = var.resource_group_location

  identity {
    type = "UserAssigned"
    identity_ids = [
      var.identity_id
    ]
  }
  tags = var.tags

  template {
    container {
      name   = "main"
      image  = var.image
      cpu    = var.cpu
      memory = var.memory

      readiness_probe {
        path                    = var.healthcheck.path # Checks for status code 200 - 399
        port                    = var.container_port
        success_count_threshold = 1
        failure_count_threshold = var.healthcheck.unhealthy_threshold
        interval_seconds        = var.healthcheck.interval
        timeout                 = var.healthcheck.timeout
        transport               = "HTTP"
      }

      dynamic "env" {
        for_each = var.env_vars

        content {
          name  = env.key
          value = env.value
        }
      }

      dynamic "env" {
        for_each = var.secrets

        content {
          name        = env.value.env_name
          secret_name = env.value.secret_name
        }
      }
    }
  }

  dynamic "secret" {
    for_each = var.secrets

    content {
      identity            = var.identity_id
      key_vault_secret_id = secret.value.secret_id
      name                = secret.value.secret_name
    }
  }

  registry {
    server   = split("/", var.image)[0]
    identity = var.identity_id
  }

  dynamic "manual_trigger_config" {
    for_each = var.manual_trigger_config != null ? [var.manual_trigger_config] : []
    content {
      parallelism              = var.manual_trigger_config.parallelism
      replica_completion_count = var.manual_trigger_config.replica_completion_count
    }
  }

  dynamic "schedule_trigger_config" {
    for_each = var.schedule_trigger_config != null ? [var.schedule_trigger_config] : []
    content {
      cron_expression          = var.schedule_trigger_config.cron_expression
      parallelism              = var.schedule_trigger_config.parallelism
      replica_completion_count = var.schedule_trigger_config.replica_completion_count
    }
  }
}
