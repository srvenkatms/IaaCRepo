# Input variable: Name of the Public IP
variable "name" {
  description = "The name of the Public IP."
  type        = string
  default     = "sv-my-public-ip"
}

# Input variable: Location/Region
variable "location" {
  description = "The location/region where the Public IP is created."
  type        = string
  default     = "East US"
}

# Input variable: Resource Group Name
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP."
  type        = string
  default     = "rgrgdeviaac"
}

# Input variable: Allocation Method
variable "allocation_method" {
  description = "Defines the allocation method for the Public IP. Possible values are Static or Dynamic."
  type        = string
  default     = "Static"
}
variable "sku" {
  description = "The SKU of the Public IP. Possible values are Basic or Standard."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}