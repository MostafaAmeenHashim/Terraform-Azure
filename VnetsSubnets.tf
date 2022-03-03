resource "azurerm_virtual_network" "vnet-con-prd-001" {
  name                = var.vnet-con-prd-001
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.region1-vnet1-address-space]
  dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}
resource "azurerm_subnet" "region1-vnet1-snet1" {
  name                 = var.region1-vnet1-snet1-name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.region1-vnet1-hub1.name
  address_prefixes     = [var.region1-vnet1-snet1-range]
}

#VNETs and Subnets
resource "azurerm_virtual_network" "vnet-con-prd-001" {
  name                = var.vnet-con-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg-vnet-conn-001
  address_space       = var.vnet-con-prd-001-address-space
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-ide-prd-001" {
  name                = var.vnet-ide-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg-identity-conn-001
  address_space       = var.vnet-ide-prd-001-address-space
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-app-prd-001" {
  name                = var.vnet-app-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg-vnet-app-001
  address_space       = var.vnet-app-prd-001-address-space
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-dmz-prd-001" {
  name                = var.vnet-dmz-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg-vnet-dmz-001
  address_space       = var.vnet-dmz-prd-001-address-space
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

##creat snets
resource "azurerm_subnet" "vnet-con-prd-001-GatewaySubnet" {
  name                 = var.vnet-con-prd-001-GatewaySubnet-name
  resource_group_name  = azurerm_resource_group.rg-vnet-conn-001
  virtual_network_name = azurerm_virtual_network.vnet-con-prd-001
  address_prefixes     = var.vnet-con-prd-001-GatewaySubnet-range
}

resource "azurerm_subnet" "vnet-con-prd-001-AzureBastionSubnet" {
  name                 = var.vnet-con-prd-001-AzureBastionSubnet-name
  resource_group_name  = azurerm_resource_group.rg-vnet-conn-001
  virtual_network_name = azurerm_virtual_network.vnet-con-prd-001
  address_prefixes     = var.vnet-con-prd-001-GatewaySubnet-range
}


