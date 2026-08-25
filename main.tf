# ---------------------------------------------------------------------------------------------------------------------
# Enterprise Azure Landing Zone - Management Group Hierarchy Module
# ---------------------------------------------------------------------------------------------------------------------
module "management_group_hierarchy" {
  source = "./modules/management_groups"

  root_id                    = var.root_id
  root_name                  = var.root_name
  parent_management_group_id = var.parent_management_group_id
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  subscription_placement     = var.subscription_placement
  tags                       = var.tags
}
