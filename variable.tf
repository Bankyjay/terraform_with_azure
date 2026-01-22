#string data type variable
variable "environment" {
  description = "The environment for the resources"
  type        = string
  default = "dev"
}

#number data type variable
variable "storage_disk" {
  description = "The size of the storage disk in GB"
  type        = number
  default     = 80
  
}

#boolean data type variable
variable "is_delete" {
  type = bool
  description = "delete os disk when delete vm"
  default = true
}

#list data type variable
variable "allowed_locations" {
  description = "The list of allowed locations for resource deployment"
  type        = list(string)
  default     = ["West Europe", "East US", "North Europe"]
  
}

#map data type variable
variable "resource_tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default = {
    environment = "staging"
    managed_by = "terraform"
    team = "devops"
  }
}

#tuple data type variable comprises of (strings number and boolean)
variable "network_config" {
  type = tuple([string, string, number])
  description = "Network configuration (VNET address, subnet address, subnet mask)"
  default = [ "10.0.0.0/16", "10.0.2.0", 24 ]
}

variable "allowed_vm_sizes" {
  description = "A list of allowed VM sizes"
  type        = list(string)
  default     = ["Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2"]
}

#object data type variable
variable "vm_config" {
  type = object({
    size = string
    publisher = string
    offer = string
    sku = string
    version = string

  })
  description = "Configuration for the virtual machine"
  default = {
    size = "Standard_DS2_v2"
    publisher = "canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}