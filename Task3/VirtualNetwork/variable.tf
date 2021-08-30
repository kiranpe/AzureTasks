variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  default     = "VirtualNWRG"
}

variable "loc" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "VirtualNetWork"
}

variable "vnet_range" {
  description = "Virtual Network CIDR Block"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "snet_name" {
  description = "Subnet Name"
  type        = string
  default     = "SubNet"
}

variable "snet_range" {
  description = "Subnet CIDR Block"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "ip_name" {
  description = "Public Ip Name"
  type        = string
  default     = "PublicIP"
}

variable "ip_method" {
  description = "Public IP Method"
  type        = string
  default     = "Static"
}

variable "nwi_name" {
  description = "Network Interface Name"
  type        = string
  default     = "NetWorkInterface"
}

variable "nwi_ip_config_name" {
  description = "NetWork Interface Configuration Name"
  type        = string
  default     = "internal"
}

variable "nwi_private_ip_alloc" {
  default = "Dynamic"
}
