resource "azurerm_storage_account" "tf-storage-account" {
  name                     = "tfstoragetest212026"
  resource_group_name      = azurerm_resource_group.tf-resource-group.name
  location                 = azurerm_resource_group.tf-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.common_tags.environment
  }
}

