# Input variable: Name of Storage Account
variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique, length between 3 and 24 characters and contain numbers and lowercase letters only."
  default     = "svtfstatestorage99"
}

# Input variable: Name of Storage container
variable "container_name" {
  description = "The name of the Blob Storage container."
  default     = "tfstatestoragecont"
}
variable "name" {
  description = "The name of the Public IP."
  type        = string
  default = "sv-my-public-ip"
}

variable "location" {
  description = "The location/region where the Public IP is created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP."
  type        = string
  default     = "rgakskubent"
}

variable "allocation_method" {
  description = "Defines the allocation method for the Public IP. Possible values are Static or Dynamic."
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the Public IP. Possible values are Basic or Standard."
  type        = string
  default     = "STandard"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}