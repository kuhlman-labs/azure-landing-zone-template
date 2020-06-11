###
#  module outputs
###

output "aks_id" {
  value       = module.aks.id
  description = "The ID of the Kubernetes Managed Cluster."
}

output "aks_fqdn" {
  value       = module.aks.fqdn
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
}

output "aks_node_resource_group" {
  value       = module.aks.node_resource_group
  description = "Auto-generated Resource Group containing AKS Cluster resources."
}

output "aks_kube_config_raw" {
  value       = module.aks.kube_config_raw
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools."
}

output "aks_kube_config_client_key" {
  value       = module.aks.kube_config_client_key
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
}

output "aks_kube_config_client_certificate" {
  value       = module.aks.kube_config_client_certificate
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
}

output "aks_kube_config_cluster_ca_certificate" {
  value       = module.aks.kube_config_cluster_ca_certificate
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
}

output "aks_kube_config_host" {
  value       = module.aks.kube_config_host
  description = "The Kubernetes cluster server host."
}

output "aks_kube_config_username" {
  value       = module.aks.kube_config_username
  description = "A username used to authenticate to the Kubernetes cluster."
}

output "aks_kube_config_password" {
  value       = module.aks.kube_config_password
  description = "A password or token used to authenticate to the Kubernetes cluster."
}
