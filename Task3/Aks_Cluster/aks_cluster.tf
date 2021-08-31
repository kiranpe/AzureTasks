#AKS Cluster Configuration

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = "1.20.9"
  dns_prefix          = var.aks_dns_prefix

  default_node_pool {
    name       = var.aks_pool_name
    node_count = var.aks_node_count
    vm_size    = var.aks_node_vm_size
  }

  identity {
    type = var.aks_identity
  }

  addon_profile {
    http_application_routing {
      enabled = var.enable
    }

    oms_agent {
      enabled                    = var.enable
      log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
    }
  }

  tags = {
    Environment = "Test"
  }
}

#Store kubeconfig file Locally

resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.cluster]
  filename   = "kubeconfig"
  content    = azurerm_kubernetes_cluster.cluster.kube_config_raw
}
