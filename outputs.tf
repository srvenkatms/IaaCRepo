# Output variable: Blob Storage container name

output "public_ip_id" {
  description = "The ID of the Public IP."
  value       = module.public_ip.public_ip_id
}

output "public_ip_address" {
  description = "The IP address of the Public IP."
  value       = module.public_ip.public_ip_address
}