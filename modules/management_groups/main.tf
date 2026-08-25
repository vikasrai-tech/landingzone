# ---------------------------------------------------------------------------------------------------------------------
# Top-Level Intermediate Root Management Group
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_management_group" "root" {
  name                       = "mg-${var.root_id}"
  display_name               = var.root_name
  parent_management_group_id = var.parent_management_group_id != null && var.parent_management_group_id != "" ? var.parent_management_group_id : var.tenant_id
  subscription_ids           = lookup(var.subscription_placement, "root", null)
}

# ---------------------------------------------------------------------------------------------------------------------
# Platform Management Groups (Level 1 & Level 2)
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_management_group" "platform" {
  name                       = "mg-${var.root_id}-platform"
  display_name               = "Platform"
  parent_management_group_id = azurerm_management_group.root.id
  subscription_ids           = lookup(var.subscription_placement, "platform", null)
}

resource "azurerm_management_group" "platform_management" {
  name                       = "mg-${var.root_id}-platform-management"
  display_name               = "Management & Monitoring"
  parent_management_group_id = azurerm_management_group.platform.id
  subscription_ids           = lookup(var.subscription_placement, "management", null)
}

resource "azurerm_management_group" "platform_connectivity" {
  name                       = "mg-${var.root_id}-platform-connectivity"
  display_name               = "Connectivity & Networking"
  parent_management_group_id = azurerm_management_group.platform.id
  subscription_ids           = lookup(var.subscription_placement, "connectivity", null)
}

resource "azurerm_management_group" "platform_identity" {
  name                       = "mg-${var.root_id}-platform-identity"
  display_name               = "Identity & Access"
  parent_management_group_id = azurerm_management_group.platform.id
  subscription_ids           = lookup(var.subscription_placement, "identity", null)
}

# ---------------------------------------------------------------------------------------------------------------------
# Workloads / Landing Zones Management Groups (Level 1 & Level 2)
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_management_group" "landing_zones" {
  name                       = "mg-${var.root_id}-landingzones"
  display_name               = "Landing Zones"
  parent_management_group_id = azurerm_management_group.root.id
  subscription_ids           = lookup(var.subscription_placement, "landingzones", null)
}

resource "azurerm_management_group" "workloads_corp" {
  name                       = "mg-${var.root_id}-workloads-corp"
  display_name               = "Corporate Workloads"
  parent_management_group_id = azurerm_management_group.landing_zones.id
  subscription_ids           = lookup(var.subscription_placement, "corp", null)
}

resource "azurerm_management_group" "workloads_online" {
  name                       = "mg-${var.root_id}-workloads-online"
  display_name               = "Online Workloads"
  parent_management_group_id = azurerm_management_group.landing_zones.id
  subscription_ids           = lookup(var.subscription_placement, "online", null)
}

resource "azurerm_management_group" "workloads_nonprod" {
  name                       = "mg-${var.root_id}-workloads-nonprod"
  display_name               = "Non-Production Workloads"
  parent_management_group_id = azurerm_management_group.landing_zones.id
  subscription_ids           = lookup(var.subscription_placement, "nonprod", null)
}

# ---------------------------------------------------------------------------------------------------------------------
# Sandbox Management Group (Level 1)
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_management_group" "sandbox" {
  name                       = "mg-${var.root_id}-sandbox"
  display_name               = "Sandbox"
  parent_management_group_id = azurerm_management_group.root.id
  subscription_ids           = lookup(var.subscription_placement, "sandbox", null)
}

# ---------------------------------------------------------------------------------------------------------------------
# Decommissioned Management Group (Level 1)
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_management_group" "decommissioned" {
  name                       = "mg-${var.root_id}-decommissioned"
  display_name               = "Decommissioned"
  parent_management_group_id = azurerm_management_group.root.id
  subscription_ids           = lookup(var.subscription_placement, "decommissioned", null)
}
