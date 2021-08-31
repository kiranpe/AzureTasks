#Vnet Configuration

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_cidr
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}

#Subnet Configuration

resource "azurerm_subnet" "snet" {
  name                 = var.snet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.snet_cidr
}

#Public IP COnfiguration

resource "azurerm_public_ip" "ip" {
  name                = var.ip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = var.ip_method

  tags = local.common_tags
}

#N/W Interface Configuration

resource "azurerm_network_interface" "nwinterface" {
  name                = var.nwi_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = var.nwi_ip_config_name
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = var.nwi_private_ip_alloc
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

#Route Table Configuration

resource "azurerm_route_table" "aks-routetable" {
  name                = var.route_table_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  route {
    name                   = var.route_name
    address_prefix         = var.route_cidr
    next_hop_type          = var.route_hop_type
    next_hop_in_ip_address = "10.10.1.1"
  }
}

#Subnet and Route Table Association

resource "azurerm_subnet_route_table_association" "route_table_assoc" {
  subnet_id      = azurerm_subnet.snet.id
  route_table_id = azurerm_route_table.aks-routetable.id
}

#Subnet and NSG Association

resource "azurerm_subnet_network_security_group_association" "sec_grp_assoc" {
  subnet_id                 = azurerm_subnet.snet.id
  network_security_group_id = azurerm_network_security_group.mysecgrp.id
}
