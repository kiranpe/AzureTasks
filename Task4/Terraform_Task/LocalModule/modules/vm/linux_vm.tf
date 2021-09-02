#Linux VM Configuration

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = var.vm_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = var.disk_size
  admin_username      = var.user_name
  network_interface_ids = [
    azurerm_network_interface.nwinterface.id,
  ]

  admin_ssh_key {
    username   = var.user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }

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
}
