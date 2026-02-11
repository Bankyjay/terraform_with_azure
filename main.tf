locals {
  formatted_project_name = lower(replace(var.project_name, " ", "-"))
  merge_tags = merge(var.default_tags, var.environment_tags)
  storageaccname_formatted = replace(lower(substr(var.storage_account_name,0,23)), " ", "")
  formatted_ports = split(",", (var.allowed_ports))
  nsg_rules = [for port in local.formatted_ports : {
    name = "port-${port}"
    port = port
    description = "Allow inbound traffic on port ${port}"
    priority = 100 + index(local.formatted_ports, port) * 10
  }]
  vm_size = lookup(var.vm_sizes, var.environment, lower("dev"))

  user_location = ["eastus", "westus", "eastus",]
  default_location = ["centalus"]
  unique_location = toset((concat(local.user_location, local.default_location)))
  
  monthly_cost = [-50, 100, 75, 200]
  positive_cost = [for cost in local.monthly_cost :
  abs(cost)]
  max_cost = max(local.positive_cost...)

  current_time = timestamp()
  resource_name = formatdate("YYYYMMDD",local.current_time)
  tag_date = formatdate("DD-MM-YYYY",local.current_time)

  config_content = jsondecode(file(config.json))

}

resource "azurerm_resource_group" "rg" {
  name     = "${local.formatted_project_name}-rg"
  location = "westus2"
  tags = local.merge_tags
}

resource "azurerm_storage_account" "example" {
  name                     = local.storageaccname_formatted
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = local.merge_tags
  
}

resource "azurerm_network_security_group" "network-tf" {
  name               = "${local.formatted_project_name}-nsg"
  location           = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = local.nsg_rules
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      description                = security_rule.value.description
    }    
  }
  
}
