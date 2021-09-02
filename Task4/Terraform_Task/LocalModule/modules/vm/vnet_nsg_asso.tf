resource "azurerm_public_ip" "ip" {
  name                = var.ip_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = var.ip_method
}

resource "azurerm_network_interface" "nwinterface" {
  name                = var.nwi_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  ip_configuration {
    name                          = var.nwi_ip_config_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = var.nwi_private_ip_alloc
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

resource "azurerm_subnet_network_security_group_association" "sec_grp_asso" {
  subnet_id                 = data.azurerm_subnet.subnet.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}
