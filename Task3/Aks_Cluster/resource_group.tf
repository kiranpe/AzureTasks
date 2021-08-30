#Resource Group Configuration

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc

  tags = local.common_tags
}

#Route Table Configuration

resource "azurerm_route_table" "route_table" {
  name                          = "acceptanceTestSecurityGroup1"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  disable_bgp_route_propagation = false

  route {
    name           = "route1"
    address_prefix = "10.3.0.0/16"
    next_hop_type  = "vnetlocal"
  }

  tags = {
    environment = "Test"
  }
}

#Log Analytics Workspace

resource "random_string" "random" {
  length  = var.random_num
  special = var.spcl_char
  upper   = var.spcl_char
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "acctest-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_storage_account" "sa" {
  name                     = "storagesa${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa_acc_tier
  account_replication_type = var.sa_rep_type

  tags = {
    environment = "staging"
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_valut" {
  name                        = "keyvault${random_string.random.id}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_monitor_diagnostic_setting" "monitor" {
  name               = "monitor_diagnostics"
  target_resource_id = azurerm_key_vault.key_valut.id
  storage_account_id = azurerm_storage_account.sa.id

  log {
    category = "AuditEvent"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
