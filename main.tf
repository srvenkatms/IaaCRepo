terraform {
  backend "azurerm" {
    resource_group_name  = "rgakskubent"
    storage_account_name = "svtfstatestorage99"
    container_name       = "tfstatestoragecont"
    key                  = "tfstate_file.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create a Resource Group if it doesn’t exist
resource "azurerm_resource_group" "tfexample" {
  name     = var.resource_group_name
  location = var.location
}

module "public_ip" {
  source              = "./terraform-modules/public-ip"
  name                = var.name
  location            = azurerm_resource_group.tfexample.location
  resource_group_name = azurerm_resource_group.tfexample.name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  tags = {
    environment = "production"
  }
}