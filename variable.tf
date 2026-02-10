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