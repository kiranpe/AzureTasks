variable "rg_name" {
  description = "Resource Group Name"
  type        = list(string)
  default     = ["VirtualNWRG-EAST", "VirtualNWRG-WEST"]
}

variable "rg_loc" {
  description = "Resource Group Location"
  type        = list(string)
  default     = ["eastus", "westus2"]
}

variable "sec_grp_name" {
  description = "Scurity Group Name"
  type        = string
  default     = "VirtualNWSecGrp"
}

variable "sec_ingress" {
  description = "List of Security Group Ingress Rules"
  type        = list(any)

  default = [
    # [name, priority, direction, access, protocol, destination_port_ranges, source_address_prefix, destination_address_prefix]
    ["AllowHttpsInbound", "120", "Inbound", "Allow", "Tcp", "443", "Internet", "*"],
    ["AllowLinuxSSHInbound", "130", "Inbound", "Allow", "Tcp", "22", "*", "*"],
    ["AllowWindowsSSHInbound", "140", "Inbound", "Allow", "Tcp", "3389", "*", "*"],
    ["AllowHttpInbound", "110", "Inbound", "Allow", "Tcp", "80", "Internet", "*"],
    ["AllowBastionHostCommunication", "150", "Inbound", "Allow", "Tcp", "8080", "VirtualNetwork", "VirtualNetwork"]
  ]
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "VirtualNetWork"
}

variable "vnet_cidr" {
  description = "Virtual Network CIDR Block"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "snet_name" {
  description = "Subnet Name"
  type        = string
  default     = "SubNet"
}

variable "snet_cidr" {
  description = "Subnet CIDR Block"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
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
