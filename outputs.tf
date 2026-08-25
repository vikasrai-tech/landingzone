output "tenant_id" {
  description = "The Tenant ID context used for the deployment."
  value       = data.azurerm_client_config.current.tenant_id
}

output "root_management_group_id" {
  description = "The Resource ID of the intermediate root Management Group."
  value       = module.management_group_hierarchy.root_management_group.id
}

output "root_management_group_name" {
  description = "The name (ID key) of the intermediate root Management Group."
  value       = module.management_group_hierarchy.root_management_group.name
}

output "management_group_hierarchy" {
  description = "Full map of management group definitions created by the hierarchy module."
  value       = module.management_group_hierarchy.management_groups
}
