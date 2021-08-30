variable "random_num" {
  description = "Lenth of Random string"
  type        = number
  default     = 10
}

variable "spcl_char" {
  description = "Specail charecters in string. true or false"
  type        = bool
  default     = false
}

variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  default     = "StaticWebSiteRG"
}

variable "rg_loc" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}

variable "rg_acc_tier" {
  description = "Resource Group Account Tier"
  type        = string
  default     = "Standard"
}

variable "rg_rep_type" {
  description = "Resource Group Replication Type"
  type        = string
  default     = "GRS"
}

variable "index_file" {
  description = "Static Website Index file Name"
  type        = string
  default     = "index.html"
}

variable "storage_blob_container_name" {
  description = "Storage Blob Container Name"
  type        = string
  default     = "$web"
}

variable "storage_blob_type" {
  description = "Storage Blob Type"
  type        = string
  default     = "Block"
}

variable "content_type" {
  description = "Index file Content type"
  type        = string
  default     = "text/html"
}
