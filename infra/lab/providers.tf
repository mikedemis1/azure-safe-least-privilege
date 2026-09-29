# Auth comes from `az login`. No credentials in code.
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
