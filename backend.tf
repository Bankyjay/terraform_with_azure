terraform {
  backend "azurerm" {
    resource_group_name  = "tf_backend"
    storage_account_name = "tfstorage212026"
    container_name       = "tfbackend"
    key                  = "dev.terraform.tfstate"
  }
}