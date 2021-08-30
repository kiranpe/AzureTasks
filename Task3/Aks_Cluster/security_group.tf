#Secuirty Group Resource Configuration

resource "azurerm_network_security_group" "mysecgrp" {
  name                = var.sec_grp_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

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
