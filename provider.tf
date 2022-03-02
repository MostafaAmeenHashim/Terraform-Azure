######################################
# Providers 
######################################
terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.94.0"
    }
  }
}
provider "azurerm" {
  features {}
}
######################################
# Platform Providers 
######################################
# DMZ
provider "azurerm" {
  features {}
  alias           = "DMZ"
  subscription_id = "1b5cd618-224f-42b9-8a33-8f34cdad87af"

}
# Connectivity
provider "azurerm" {
  features {}
  alias           = "connectivity"
  subscription_id = "1b5cd618-224f-42b9-8a33-8f34cdad87af"

}
# Identity
provider "azurerm" {
  features {}
  alias           = "identity"
  subscription_id = "1b5cd618-224f-42b9-8a33-8f34cdad87af"
}

######################################
# Backend 
######################################
#terraform {
#  backend "azurerm" {
#    resource_group_name  = "rg-tf-cust-prod-001"
#    storage_account_name = "cdwtfdeploy"
#    container_name       = "tfstate"
#    key                  = "terraform.tfstate"
#  }
#}