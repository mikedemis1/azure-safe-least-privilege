locals {
  environments = ["dev", "staging", "prod"]

  common_tags = {
    project    = "azure-safe-least-privilege"
    managed_by = "terraform"
  }
}

# One resource group per environment. See docs/decisions/0001-resource-groups-per-environment.md
resource "azurerm_resource_group" "env" {
  for_each = toset(local.environments)

  name     = "rg-lab-${each.key}"
  location = var.location
  tags     = merge(local.common_tags, { env = each.key })
}
