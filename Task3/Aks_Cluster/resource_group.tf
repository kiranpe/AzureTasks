#Resource Group Configuration

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.loc

  tags = local.common_tags
}

#Log Analytics Workspace

resource "random_string" "random" {
  length  = var.random_num
  special = var.disable
  upper   = var.disable
}

#Log Analytics Workspace Configuration

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.log_analytics_sku
  retention_in_days   = var.log_analytics_retention_days
}

#Storage Account Configuration

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

#DataStore for Client Config Details

data "azurerm_client_config" "current" {}

#Key Vault Configuration

resource "azurerm_key_vault" "key_valut" {
  name                        = "keyvault${random_string.random.id}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = var.enable
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.key_vault_retention_days
  purge_protection_enabled    = var.disable

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Backup", "Create", "Delete", "Get", "Import", "Purge", "Update",
    ]

    secret_permissions = [
      "Backup", "Delete", "Get", "Purge",
    ]

    storage_permissions = [
      "Backup", "Delete", "Get", "Purge", "Update",
    ]
  }
}

#Monitor Diagnosic Setting Configuration

resource "azurerm_monitor_diagnostic_setting" "monitor" {
  name               = var.monitor_diagnostics_name
  target_resource_id = azurerm_key_vault.key_valut.id
  storage_account_id = azurerm_storage_account.sa.id

  log {
    category = "AuditEvent"
    enabled  = var.disable

    retention_policy {
      enabled = var.disable
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = var.disable
    }
  }
}
