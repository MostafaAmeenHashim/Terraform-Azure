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