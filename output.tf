output "env" {
  description = "The deployment environment"
  value       = var.environment
  
}

output "security_rule" {
  description = "The NSG security rules"
  value       = var.allowed_vm_sizes[*]
}

#for loop to iterate through the map and get the description of each rule
output "demo" {
  value = [ for count in local.nsg_rules : count.description]
}