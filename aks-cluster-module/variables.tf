# Input variables

variable "aks_cluster_name" {
    description = "The name of the AKS cluster to be created"
    type = string
    default = "aks-cluster"
}

variable "cluster_location" {
    description = "The azure region where the aks cluster would be deployed"
    type = string
    default = "UK South"
}

variable "dns_prefix" {
    description = "Defines the dns prefix of cluster"
    type = string
}

variable "kubernetes_version" {
    description = "Specifies which kubernetes version the cluster would use"
    type = string
    default = "1.26.6"
}

variable "service_principal_client_id" {
    description = "Provides the Client id of the service_principal"
    type = string
}

variable "service_principal_secret" {
    description = "Provides the secret for the service principle"
    type = string
}

# Adding the following output variables from networking module as input
# variables

output "vnet_id" {
    description = "For storing the id of previously created vnet"
    value = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
    description = "For storing the id of the control plane subnet within the vnet"
    value = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
    description = "For storing the id of the worker node subnet within the vnet"
    value = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
    description = "Azure resource where network resources are provioned in"
    value = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
    description = "For storing the ID of network security group (NSG)"
    value = azurerm_network_security_group.aks_nsg.id
}