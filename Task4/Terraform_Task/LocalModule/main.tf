module "linux_vm" {
  source = "./modules/vm"

  #Linux VM Variables

  vm_name = "LinuxVM"

  disk_size = "Standard_D2s_v3"

  user_name = "ubuntu"

  os_caching = "ReadWrite"

  storage_type = "Standard_LRS"

  os_ref = [{
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }]

  ip_name = "MyIP"

  ip_method = "Static"

  nwi_name = "MyNWI"

  nwi_ip_config_name = "internal"

  nwi_private_ip_alloc = "Dynamic"
}
