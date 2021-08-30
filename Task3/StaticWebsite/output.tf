output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "sa_id" {
  value = azurerm_storage_account.sa.id
}

output "staticweb_url" {
  value = azurerm_storage_blob.static_web_site.url
}
