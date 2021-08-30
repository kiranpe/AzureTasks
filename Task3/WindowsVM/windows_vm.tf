#Windows VM Configuration

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azurerm_windows_virtual_machine" "winvm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  size                = var.disk_size
  admin_username      = var.user_name
  admin_password      = random_password.password.result

  network_interface_ids = [
    azurerm_network_interface.nwinterface.id,
  ]

  os_disk {
    caching              = var.os_caching
    storage_account_type = var.storage_type
  }

  dynamic "source_image_reference" {
    for_each = var.os_ref
    content {
       publisher = source_image_reference.value["publisher"]
       offer     = source_image_reference.value["offer"]
       sku       = source_image_reference.value["sku"]
       version   = source_image_reference.value["version"]
    }
  }

  tags = local.common_tags 
}
