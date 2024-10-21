terraform {
  backend "azurerm" {
    resource_group_name  = "rgakskubent"
    storage_account_name = "svtfstatestorage99"
    container_name       = "tfstatestoragecont"
    key                  = "tfstate_file.tfstate"
    tenant_id            = "16b3c013-d300-468d-ac64-7eda0820b6d3"
    subscription_id      = "20e88eb0-b38b-4513-a432-7b6f168c2a67"
  }
}