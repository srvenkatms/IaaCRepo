# Output variable: Blob Storage container name
output "blob_storage_container" {
  value = "https://${azurerm_storage_account.backend.name}.blob.core.windows.net/${azurerm_storage_container.backend.name}/"
}
output "public_ip_id" {
  description = "The ID of the Public IP."
  value       = module.public_ip.public_ip_id
}

output "public_ip_address" {
  description = "The IP address of the Public IP."
  value       = module.public_ip.public_ip_address
}