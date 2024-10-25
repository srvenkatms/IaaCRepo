

resource "azurerm_resource_group" "backend" {
  name     = "rgakskubent"
  location = "East US"
}

resource "azurerm_storage_account" "backend" {
  name                     = "svtfstatestorage99"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "my-terraform-env"
  }
}

resource "azurerm_storage_container" "backend" {
  name                  = "tfstatestoragecont"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "storage_account_key_operator" {
  principal_id         = "84f6f1be-759f-4225-b540-e87ee015ea2c"
  role_definition_name = "Storage Account Key Operator Service Role"
  scope                = azurerm_storage_account.backend.id
}