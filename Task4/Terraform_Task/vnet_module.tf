module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  route_tables_ids = {
    subnet1 = azurerm_route_table.route_table.id
    subnet2 = azurerm_route_table.route_table.id
    subnet3 = azurerm_route_table.route_table.id
  }


  tags = {
    environment = "dev"
  }
}

resource "azurerm_route_table" "route_table" {
  name                = "MyRouteTable"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}

resource "azurerm_route" "route" {
  name                = "Route1"
  resource_group_name = data.azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "vnetlocal"
}
