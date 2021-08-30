#Resource Group Variables

variable "myrg_name" {
  description = "My Resource Group Name"
  type        = string
  default     = "LinuxRG"
}

variable "myrg_loc" {
  description = "My Resoure Group Location"
  type        = string
  default     = "eastus"
}

#Security Group Variables

variable "create_sec_grp" {
  description = "Create Security Group or Not"
  type        = string
  default     = "true"
}

variable "sec_grp_name" {
  description = "Scurity Group Name"
  type        = string
  default     = "NetWorkSecGrp"
}

variable "sec_ingress" {
  description = "List of Security Group Ingress Rules"
  type        = list(any)

  default = [
    # [name, priority, direction, access, protocol, destination_port_ranges, source_address_prefix, destination_address_prefix]
    ["AllowLinuxSSHInbound", "100", "Inbound", "Allow", "Tcp", "22", "*", "*"],
  ]
}

#VNet Variables

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "MyVNet"
}

variable "vnet_range" {
  description = "Virtual Network CIDR Block"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "snet_name" {
  description = "Subnet Name"
  type        = string
  default     = "MySNet"
}

variable "snet_range" {
  description = "Subnet CIDR block range"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "ip_name" {
  description = "Public Ip Name"
  type        = string
  default     = "MyIP"
}

variable "ip_method" {
  description = "Public Ip Allocation Method"
  type        = string
  default     = "Static"
}

variable "nwi_name" {
  description = "Network Interface Name"
  type        = string
  default     = "MyNWI"
}

variable "nwi_ip_config_name" {
  description = "Network Interface IP Configuration Name"
  type        = string
  default     = "internal"
}

variable "nwi_private_ip_alloc" {
  description = "Network Interface Private IP Allocation type"
  type        = string
  default     = "Dynamic"
}

#Linux VM Variables

variable "vm_name" {
  description = "Linux VM Namw"
  type        = string
  default     = "LinuxVM"
}

variable "disk_size" {
  description = "Linux VM Disk size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "user_name" {
  description = "Linux VM username"
  type        = string
  default     = "ubuntu"
}

variable "os_caching" {
  description = "OS Caching Type"
  type        = string
  default     = "ReadWrite"
}

variable "storage_type" {
  description = "OS Storage Account Type"
  type        = string
  default     = "Standard_LRS"
}

variable "os_ref" {
  description = "Ubuntu Image Reference"
  type        = list(any)
  default     = [{
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }]
}
