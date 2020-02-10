resource "azurerm_storage_account" "storage_account" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = var.kind
  account_tier              = var.tier
  account_replication_type  = var.replication_type
  tags                      = var.tags
  enable_https_traffic_only = true

  dynamic "network_rules" {
    for_each = length(concat(var.network_rule_ip_addresses, var.network_rule_subnets, var.network_rule_bypass)) > 0 ? ["true"] : []
    content {
      default_action             = var.network_rule_default_action
      bypass                     = var.network_rule_bypass
      ip_rules                   = var.network_rule_ip_addresses
      virtual_network_subnet_ids = var.network_rule_subnets
    }
  }
}

resource "azurerm_storage_container" "container" {
  name                  = var.containers[count.index].name
  resource_group_name   = var.resource_group_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.containers[count.index].access_type
  count                 = length(var.containers)
}
