#Linux VM Variables

variable "vm_name" {
  description = "Linux VM Namw"
  type        = string
}

variable "disk_size" {
  description = "Linux VM Disk size"
  type        = string
}

variable "user_name" {
  description = "Linux VM username"
  type        = string
}

variable "os_caching" {
  description = "OS Caching Type"
  type        = string
}

variable "storage_type" {
  description = "OS Storage Account Type"
  type        = string
}

variable "os_ref" {
  description = "Ubuntu Image Reference"
  type        = list(any)
}

variable "ip_name" {
  description = "Public Ip Name"
  type        = string
}

variable "ip_method" {
  description = "Public Ip Allocation Method"
  type        = string
}

variable "nwi_name" {
  description = "Network Interface Name"
  type        = string
}

variable "nwi_ip_config_name" {
  description = "Network Interface IP Configuration Name"
  type        = string
}

variable "nwi_private_ip_alloc" {
  description = "Network Interface Private IP Allocation type"
  type        = string
}
