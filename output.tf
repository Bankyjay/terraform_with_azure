output "rgname" {
  value = azurerm_resource_group.rg.name
  
}
output "storageaccountname" {
  value = azurerm_storage_account.example.name
  
}

output "nsg_rules" {
  value = local.nsg_rules 
}

output "security_name" {
  value = "azurerm_network_security_group.network-tf.name"
}