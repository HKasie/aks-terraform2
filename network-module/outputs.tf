output "vnet_id" {
    description = "For storing the ID of the previously created vnet"
    value = azurerm_virtual_network.aks_vnet.id
}

output "control_plane_subnet_id" {
    description = "For storing the Id of the control plane subnet within the vnet"
    value = azurerm_subnet.control_plane_subnet.id

}

output "worker_node_subnet_id" {
    description = "For storing the Id of the worker node subnet within the vnet"
    value = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
    description = "Azure resource group for provisioning the network group"
    value = azurerm_resource_group.networking.name
}

output "aks_nsg_id" {
    description = " To store the ID of the network security group (NSG)"
    value = azurerm_network_security_group.aks_nsg.id

}