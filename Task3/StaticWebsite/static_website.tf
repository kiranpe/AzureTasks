#Azure Static WebSite

resource "random_string" "random" {
  length  = var.random_num
  special = var.spcl_char
  upper   = var.spcl_char
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_loc
}

resource "azurerm_storage_account" "sa" {
  name                     = "staticwebsite${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.rg_acc_tier
  account_replication_type = var.rg_rep_type

  static_website {
    index_document = var.index_file
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sa_container" {
  name                  = "staticwebsite"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "static_web_site" {
  name                   = var.index_file
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.sa_container.name
  type                   = var.storage_blob_type
  content_type           = var.content_type
  source_content         = "<h1>This is static content coming from the Terraform</h1>"
}
