module "network-security-group" {
  source              = "Azure/network-security-group/azurerm//modules/HTTP"
  resource_group_name = data.azurerm_resource_group.rg.name
  security_group_name = "nsg"
  custom_rules = [
    {
      name                   = "ssh"
      priority               = "100"
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      destination_port_range = "22"
      source_address_prefix  = "VirtualNetwork"
      description            = "ssh-for-vm-management"
    }
  ]
  tags = {
    environment = "dev"
  }
}
