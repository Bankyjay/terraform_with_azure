output "rgname" {
  value = azurerm_resource_group.example[*].name
}

#for loop in output variables
output "storage_name" {
  value = [for i in azurerm_storage_account.example: i.name]
  
}

output "azurerm_resource_group_id" {
  value = azurerm_resource_group.example[*].id  
}

output "storage_account_name2" {
  value = [for i in azurerm_storage_account.for_each_example: i.name]
}