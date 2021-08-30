#Vnet Configuration

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.myrg.location
  address_space       = var.vnet_range
  resource_group_name = azurerm_resource_group.myrg.name

  tags = local.common_tags
}

#Subnet Configuration

resource "azurerm_subnet" "snet" {
  name                 = var.snet_name
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet_range
}

#Public IP COnfiguration

resource "azurerm_public_ip" "ip" {
  name                = var.ip_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = var.ip_method

  tags = local.common_tags
}

#N/W Interface Configuration

resource "azurerm_network_interface" "nwinterface" {
  name                = var.nwi_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  ip_configuration {
    name                          = var.nwi_ip_config_name
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = var.nwi_private_ip_alloc
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}
