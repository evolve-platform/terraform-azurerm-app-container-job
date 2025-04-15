# Azure App Container Terraform module

Terraform module to manage an Azure App Container Job.
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_app_job.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_job) | resource |
| [azurerm_resource_group.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_app_environment_id"></a> [container\_app\_environment\_id](#input\_container\_app\_environment\_id) | The container app environment to be used for the container | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port the container listens on | `number` | `4000` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | The CPU to be used for the container | `number` | `0.25` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | Environment variables to be set in the container | `map(string)` | `{}` | no |
| <a name="input_healthcheck"></a> [healthcheck](#input\_healthcheck) | Healthcheck configuration | <pre>object({<br/>		path                = string<br/>		unhealthy_threshold = number<br/>		timeout             = number<br/>		interval            = number<br/>	})</pre> | <pre>{<br/>  "interval": 5,<br/>  "path": "/",<br/>  "timeout": 2,<br/>  "unhealthy_threshold": 3<br/>}</pre> | no |
| <a name="input_identity_id"></a> [identity\_id](#input\_identity\_id) | The identity to be used for the container | `string` | n/a | yes |
| <a name="input_image"></a> [image](#input\_image) | The image to be used for the container | `string` | n/a | yes |
| <a name="input_manual_trigger_config"></a> [manual\_trigger\_config](#input\_manual\_trigger\_config) | Configuration for manual trigger | <pre>object({<br/>		parallelism = optional(number, 1)<br/>		replica_completion_count = optional(number, 1)<br/>	})</pre> | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The memory to be used for the container | `string` | `"0.5Gi"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the container | `string` | n/a | yes |
| <a name="input_replica_timeout_in_seconds"></a> [replica\_timeout\_in\_seconds](#input\_replica\_timeout\_in\_seconds) | The maximum number of seconds a replica is allowed to run. | `number` | `600` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The resource group location to be used for the container | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group to be used for the container | `string` | n/a | yes |
| <a name="input_schedule_trigger_config"></a> [schedule\_trigger\_config](#input\_schedule\_trigger\_config) | Configuration for scheduled trigger | <pre>object({<br/>		cron_expression = string<br/>		parallelism = optional(number, 1)<br/>		replica_completion_count = optional(number, 1)<br/>	})</pre> | `null` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | <pre>list(object({<br/>		secret_id   = string<br/>		secret_name = string<br/>		env_name    = string<br/>	}))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be set on the container | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | n/a |
<!-- END_TF_DOCS -->
