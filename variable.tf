variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "ALPHA project INC"
}

variable "default_tags" {
  type = map
   default= {
    company = "CloudOps"
    managed_by = "Terraform"
  }
  
}

variable "environment_tags" {
  type = map(string)
  default = {
    environment = "production"
    cost_center = "CC-123"
  }
}

variable "storage_account_name" {
  type = string
  default = "testing storageacct name this should be defaulting"
}

variable "allowed_ports" {
  type = string
  default = "80,443,22"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)."
  type        = string
  default = "prods"
  validation {
    condition = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Enter the correct value for environment"
  }  
}

variable "vm_sizes" {
  type = map(string)
  default = {
    dev = "standard_D2s_v3"
    staging = "standard_D4s_v3"
    prod = "standard_D8s_v3"
  } 
}

variable "vm_size" {
  type = string
  default = "standard_D2s_v3"
  validation {
    condition = length(var.vm_size) >=2 && length(var.vm_size) <= 20
    error_message = "The vm_size should be between 2 and 20 characters long."
  }
  validation {
    condition = strcontains(lower(var.vm_size), "standard")
    error_message = "the vm size should contain the word standard"
    
  }  
}
variable "backup_name" {
  default = "test_backup"
  type = string
  validation {
    condition = endswith(var.backup_name, "_backup")
    error_message = "Backup name must end with _backup"
  }
}

variable "credential" {

  default = "asdf13687"
  type = string
  sensitive = true
  
}