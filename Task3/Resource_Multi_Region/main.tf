#Resource Group Configuration

resource "azurerm_resource_group" "myrg" {
  count    = length(var.rg_name)
  name     = element(var.rg_name, count.index)
  location = element(var.rg_loc, count.index)

  tags = local.common_tags
}

#Secuirty Group Resource Configuration

resource "azurerm_network_security_group" "mysecgrp" {
  count               = length(var.rg_name)
  name                = "${var.sec_grp_name}-${azurerm_resource_group.myrg[count.index].location}"
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location

  dynamic "security_rule" {
    for_each = var.sec_ingress
    content {
      name                       = security_rule.value[0] == "" ? "Default_Rule" : security_rule.value[0]
      priority                   = security_rule.value[1]
      direction                  = security_rule.value[2] == "" ? "Inbound" : security_rule.value[2]
      access                     = security_rule.value[3] == "" ? "Allow" : security_rule.value[3]
      protocol                   = security_rule.value[4] == "" ? "Tcp" : security_rule.value[4]
      source_port_range          = "*"
      destination_port_range     = security_rule.value[5]
      source_address_prefix      = security_rule.value[6] == "" ? "*" : security_rule.value[6]
      destination_address_prefix = security_rule.value[7] == "" ? "*" : security_rule.value[7]
      description                = "rule_${security_rule.value[0]}_${security_rule.value[5]}"
    }
  }

  tags = local.common_tags
}

#Security Group Association

resource "azurerm_subnet_network_security_group_association" "sec_grp_asso" {
  count                     = length(var.rg_name)
  subnet_id                 = azurerm_virtual_network.vnet[count.index].subnet.*.id[count.index]
  network_security_group_id = azurerm_network_security_group.mysecgrp[count.index].id
}

#Vnet Configuration

resource "azurerm_virtual_network" "vnet" {
  count               = length(var.rg_name)
  name                = "${var.vnet_name}-${azurerm_resource_group.myrg[count.index].location}"
  location            = azurerm_resource_group.myrg[count.index].location
  address_space       = var.vnet_cidr
  resource_group_name = azurerm_resource_group.myrg[count.index].name

  dynamic "subnet" {
    for_each = local.subnets

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }

  tags = local.common_tags
}

#Public IP COnfiguration

resource "azurerm_public_ip" "ip" {
  count               = length(var.rg_name)
  name                = var.ip_name
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location
  allocation_method   = var.ip_method

  tags = local.common_tags
}

#N/W Interface Configuration

resource "azurerm_network_interface" "nwinterface" {
  count               = length(var.rg_name)
  name                = var.nwi_name
  resource_group_name = azurerm_resource_group.myrg[count.index].name
  location            = azurerm_resource_group.myrg[count.index].location

  ip_configuration {
    name                          = var.nwi_ip_config_name
    subnet_id                     = azurerm_virtual_network.vnet[count.index].subnet.*.id[1]
    private_ip_address_allocation = var.nwi_private_ip_alloc
    public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  }
}
