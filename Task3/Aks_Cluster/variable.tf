variable "rg_name" {
  description = "Resource Group Name"
  type        = string
  default     = "AKSClusterRG"
}

variable "loc" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}

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

variable "sa_acc_tier" {
  description = "Resource Group Account Tier"
  type        = string
  default     = "Standard"
}

variable "sa_rep_type" {
  description = "Resource Group Replication Type"
  type        = string
  default     = "GRS"
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

#Virtual NetWork Variables

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
  description = "NetWork Interface Private IP Allocation"
  type        = string
  default     = "Dynamic"
}

#AKS Cluster Variables

variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
  default     = "akscluster"
}

variable "aks_dns_prefix" {
  description = "AKS Cluster DNS Prefix"
  type        = string
  default     = "k8scluster"
}

variable "aks_pool_name" {
  description = "AKS Cluster Pool Name"
  type        = string
  default     = "node1"
}

variable "aks_node_count" {
  description = "Number of AKS CLuster Nodes"
  type        = number
  default     = 1
}

variable "aks_node_vm_size" {
  description = "AKS Node VM Size"
  type        = string
  default     = "Standard_D2_v2"
}

variable "aks_identity" {
  description = "Type of AKS Identity"
  type        = string
  default     = "SystemAssigned"
}
