resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-resources"
  #implementing lists data type
  location = var.allowed_locations[2]
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name[count.index]
  count = length(var.storage_account_name)
  #count = 2 but you need a unique name for the storage account. 
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}


resource "azurerm_storage_account" "for_each_example" {
  name                     = each.value
  for_each = var.storage_account_name2
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}