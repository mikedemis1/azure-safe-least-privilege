output "resource_group_names" {
  description = "Resource group name per environment."
  value       = { for env, rg in azurerm_resource_group.env : env => rg.name }
}
