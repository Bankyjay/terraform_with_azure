terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.8.0"
    }
  }
  required_version = ">= 1.9.0"
}

provider "azurerm" {
  features {

  }

}

resource "azurerm_resource_group" "tf-resource-group" {
  name     = "tf-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "tf-storage-account" {
  name                     = "tfstoragetest212026"
  resource_group_name      = azurerm_resource_group.tf-resource-group.name
  location                 = azurerm_resource_group.tf-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Dev"
  }
}
