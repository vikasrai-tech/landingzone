provider "azurerm" {
  features {}
}

# Dynamically retrieve active Azure subscription & tenant context
data "azurerm_client_config" "current" {}
