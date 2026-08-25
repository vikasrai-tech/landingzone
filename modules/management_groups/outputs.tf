output "root_management_group" {
  description = "Top-level intermediate root management group object."
  value = {
    id           = azurerm_management_group.root.id
    name         = azurerm_management_group.root.name
    display_name = azurerm_management_group.root.display_name
  }
}

output "management_groups" {
  description = "Map of all created management groups with details."
  value = {
    root = {
      id           = azurerm_management_group.root.id
      name         = azurerm_management_group.root.name
      display_name = azurerm_management_group.root.display_name
      parent_id    = azurerm_management_group.root.parent_management_group_id
    }
    platform = {
      id           = azurerm_management_group.platform.id
      name         = azurerm_management_group.platform.name
      display_name = azurerm_management_group.platform.display_name
      parent_id    = azurerm_management_group.platform.parent_management_group_id
    }
    management = {
      id           = azurerm_management_group.platform_management.id
      name         = azurerm_management_group.platform_management.name
      display_name = azurerm_management_group.platform_management.display_name
      parent_id    = azurerm_management_group.platform_management.parent_management_group_id
    }
    connectivity = {
      id           = azurerm_management_group.platform_connectivity.id
      name         = azurerm_management_group.platform_connectivity.name
      display_name = azurerm_management_group.platform_connectivity.display_name
      parent_id    = azurerm_management_group.platform_connectivity.parent_management_group_id
    }
    identity = {
      id           = azurerm_management_group.platform_identity.id
      name         = azurerm_management_group.platform_identity.name
      display_name = azurerm_management_group.platform_identity.display_name
      parent_id    = azurerm_management_group.platform_identity.parent_management_group_id
    }
    landing_zones = {
      id           = azurerm_management_group.landing_zones.id
      name         = azurerm_management_group.landing_zones.name
      display_name = azurerm_management_group.landing_zones.display_name
      parent_id    = azurerm_management_group.landing_zones.parent_management_group_id
    }
    corp = {
      id           = azurerm_management_group.workloads_corp.id
      name         = azurerm_management_group.workloads_corp.name
      display_name = azurerm_management_group.workloads_corp.display_name
      parent_id    = azurerm_management_group.workloads_corp.parent_management_group_id
    }
    online = {
      id           = azurerm_management_group.workloads_online.id
      name         = azurerm_management_group.workloads_online.name
      display_name = azurerm_management_group.workloads_online.display_name
      parent_id    = azurerm_management_group.workloads_online.parent_management_group_id
    }
    nonprod = {
      id           = azurerm_management_group.workloads_nonprod.id
      name         = azurerm_management_group.workloads_nonprod.name
      display_name = azurerm_management_group.workloads_nonprod.display_name
      parent_id    = azurerm_management_group.workloads_nonprod.parent_management_group_id
    }
    sandbox = {
      id           = azurerm_management_group.sandbox.id
      name         = azurerm_management_group.sandbox.name
      display_name = azurerm_management_group.sandbox.display_name
      parent_id    = azurerm_management_group.sandbox.parent_management_group_id
    }
    decommissioned = {
      id           = azurerm_management_group.decommissioned.id
      name         = azurerm_management_group.decommissioned.name
      display_name = azurerm_management_group.decommissioned.display_name
      parent_id    = azurerm_management_group.decommissioned.parent_management_group_id
    }
  }
}
