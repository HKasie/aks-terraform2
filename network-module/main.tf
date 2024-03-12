resource "azurerm_resource_group" "networking" {
    name = var.resource_group_name
    location = "UK South"
}

resource "azurerm_virtual_network" "aks_vnet" {
    name = "aks_vnet"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.networking.location
    resource_group_name = azurerm_resource_group.networking.name
}

resource "azurerm_subnet" "control_plane_subnet"{
    name = "control-plane-subnet"
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    resource_group_name = azurerm_resource_group.networking.name

}
resource "azurerm_subnet" "worker_node_subnet" {
    name = "worker-node-subnet"
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    resource_group_name = azurerm_resource_group.networking.name
    address_prefixes = ["10.0.1.0/24"]

}

resource "azurerm_network_security_group" "aks_nsg" {
    name = "aks_nsg"
    resource_group_name = azurerm_resource_group.networking.name
    location = azurerm_resource_group.networking.location
}

resource "azurerm_network_security_rule" "kube_apiserver" {
    name = "kube-apiserver-rule"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.networking.name
    network_security_group_name = azurerm_network_security_group.aks_nsg.name

}

resource "azurerm_network_security_rule" "ssh" {
    name = "ssh-rule"
    resource_group_name = azurerm_resource_group.networking.name
    network_security_group_name = azurerm_network_security_group.aks_nsg.name
    priority = 1002
    direction = "Inbound"
    access = Allow
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"

}