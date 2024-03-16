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

variable "resource_group_name" {
    description = "For resource group name"
    type = string
    default = "networking-rg"
}