#Resources values

output "Account_ID" {
  value = data.azurerm_client_config.current.client_id
}

output "Tenant_ID" {
  value = data.azurerm_client_config.current.tenant_id
}

output "rg_id" {
  value = azurerm_resource_group.myrg.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "snet_id" {
  value = azurerm_subnet.snet.id
}

output "ip_address" {
  value = azurerm_public_ip.ip.ip_address
}

output "nwi_id" {
  value = azurerm_network_interface.nwinterface.id
}
