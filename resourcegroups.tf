######################################
# Resource Groups
######################################

resource "azurerm_resource_group" "rg1" {
  name     = var.rg-vnet-conn-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}

resource "azurerm_resource_group" "rg2" {
  name     = var.rg-vng-conn-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}
resource "azurerm_resource_group" "rg3" {
  name     = var.rg-azbast-conn-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}
  
resource "azurerm_resource_group" "rg4" {
  name     = var.rg-vnet-iden-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}
  resource "azurerm_resource_group" "rg5" {
  name     = var.rg-identity-conn-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
    }
  }

resource "azurerm_resource_group" "rg6" {
  name     = var.rg-rsv-iden-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "LAB"
  }
}
resource "azurerm_resource_group" "rg7" {
  name     = var.rg-vnet-app-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}

resource "azurerm_resource_group" "rg8" {
  name     = var.rg-rsv-app-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}
resource "azurerm_resource_group" "rg9" {
  name     = var.rg-route-conn-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
}
  resource "azurerm_resource_group" "rg10" {
  name     = var.rg-vnet-dmz-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
    }
  } 
  resource "azurerm_resource_group" "rg11" {
  name     = var.rg-vng-dmz-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
    }
  }
 resource "azurerm_resource_group" "rg12" {
  name     = var.rg-azbast-dmz-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
 }
 resource "azurerm_resource_group" "rg13" {
  name     = var.rg-rsv-dmz-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }

 }
 resource "azurerm_resource_group" "rg14" {
  name     = var.rg-route-dmz-001-name
  location = var.loc1
  tags = {
    Environment = var.environment_tag
    Function    = "lab-resourcegroup"
  }
 }
