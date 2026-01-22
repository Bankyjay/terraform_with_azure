locals {
  common_tags = {
    environment = var.environment
    lob     = "Engineering"
    stage  = "seeding"
  }
}