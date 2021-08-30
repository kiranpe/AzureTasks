#Account Details DataSource Configuration

data "azurerm_client_config" "current" {
}

#Resource Group Configuration

resource "azurerm_resource_group" "myrg" {
  name     = var.rg_name
  location = var.loc

  tags = local.common_tags
}
