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

output "vm_size" {
  value = local.vm_size
  
}

output "backup" {
  value = var.backup_name
  
}

output "credential" {
  value = var.credential
  sensitive = true
  
}

output "unique_location" {
  value = local.unique_location
  
}

output "max_cost" {
  value = local.max_cost
}

output "positive" {
  value = local.positive_cost
}

output "resource_tag" {
  value = local.resource_name
}

output "config_loaded" {
  value = nonsensitive(jsondecode(local.config_content))
}