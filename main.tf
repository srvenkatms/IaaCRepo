resource "azurerm_resource_group" {
  name     = var.resource_group_name
  location = var.location
}


terraform {
  backend "azurerm" {
    resource_group_name  = "rgakskubent"        # Static value
    storage_account_name = "svtfstatestorage99" # Static value
    container_name       = "tfstatestoragecont" # Static value
    key                  = "terraform.tfstate"
  }
}

module "public_ip" {
  source              = "./terraform-modules/public-ip"
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  tags = {
    environment = "production"
  }
}