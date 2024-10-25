# Create a Resource Group if it doesn’t exist
resource "azurerm_resource_group" "tfexample" {
  name     = var.resource_group_name
  location = var.location
}

# Create a Storage account
resource "azurerm_storage_account" "terraform_state" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfexample.name
  location                 = azurerm_resource_group.tfexample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "my-terraform-env"
  }
}

# Create a Storage container
resource "azurerm_storage_container" "terraform_state" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}
resource "azurerm_role_assignment" "storage_account_key_operator" {
  principal_id   = "84f6f1be-759f-4225-b540-e87ee015ea2c"
  role_definition_name = "Storage Account Key Operator Service Role"
  scope          = azurerm_storage_account.terraform_state.id
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