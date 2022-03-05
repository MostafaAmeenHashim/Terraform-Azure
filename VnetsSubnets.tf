#VNETs and Subnets
#####################

resource "azurerm_virtual_network" "vnet-con-prd-001" {
  name                = var.vnet-con-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.vnet-con-prd-001-address-space]
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-ide-prd-001" {
  name                = var.vnet-ide-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg4.name
  address_space       = [var.vnet-ide-prd-001-address-space]
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-app-prd-001" {
  name                = var.vnet-app-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg7.name
  address_space       = [var.vnet-app-prd-001-address-space]
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

resource "azurerm_virtual_network" "vnet-dmz-prd-001" {
  name                = var.vnet-dmz-prd-001-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg10.name
  address_space       = [var.vnet-dmz-prd-001-address-space]
  ##dns_servers         = ["10.10.1.4", "168.63.129.16",]
  tags = {
    Environment = var.environment_tag
    Function    = "ws-avd-lab-network"
  }
}

##creat snets
resource "azurerm_subnet" "vnet-con-prd-001-GatewaySubnet" {
  name                 = var.vnet-con-prd-001-GatewaySubnet-name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet-con-prd-001.name
  address_prefixes     = [var.vnet-con-prd-001-GatewaySubnet-range]
}

resource "azurerm_subnet" "vnet-con-prd-001-AzureBastionSubnet" {
  name                 = var.vnet-con-prd-001-AzureBastionSubnet-name
  resource_group_name  = azurerm_resource_group.rg3.name
  virtual_network_name = azurerm_virtual_network.vnet-con-prd-001.name
  address_prefixes     = [var.vnet-con-prd-001-AzureBastionSubnet-range]
}

resource "azurerm_subnet" "vnet-ide-prd-001-subnet-ide-prd-001" {
  name                 = var.vnet-ide-prd-001-subnet-ide-adds-001-name
  resource_group_name  = azurerm_resource_group.rg4.name
  virtual_network_name = azurerm_virtual_network.vnet-ide-prd-001.name
  address_prefixes     = [var.vnet-ide-prd-001-subnet-ide-adds-001-range]
}


resource "azurerm_subnet" "vnet-app-prd-001-subnet-app-prd-001" {
  name                 = var.vnet-app-prd-001-subnet-app-prd-001-name
  resource_group_name  = azurerm_resource_group.rg7.name
  virtual_network_name = azurerm_virtual_network.vnet-app-prd-001.name
  address_prefixes     = [var.vnet-app-prd-001-subnet-app-prd-001-range]
}

resource "azurerm_subnet" "vnet-dmz-prd-001-AzureBastionSubnet" {
  name                 = var.vnet-dmz-prd-001-AzureBastionSubnet-name
  resource_group_name  = azurerm_resource_group.rg12.name
  virtual_network_name = azurerm_virtual_network.vnet-dmz-prd-001.name
  address_prefixes     = [var.vnet-dmz-prd-001-AzureBastionSubnet-range]
}

resource "azurerm_subnet" "vnet-dmz-prd-001-GatewaySubnet" {
  name                 = var.vnet-dmz-prd-001-GatewaySubnet-name
  resource_group_name  = azurerm_resource_group.rg10.name
  virtual_network_name = azurerm_virtual_network.vnet-dmz-prd-001.name
  address_prefixes     = [var.vnet-dmz-prd-001-GatewaySubnet-range]
}

