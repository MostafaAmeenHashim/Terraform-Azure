######################################
# Azure Bastion
######################################

# Azure Bastion 1 for Conn sub
resource "azurerm_public_ip" "pip-AzureBastion-conn" {
  name                = "pip-AzureBastion-conn"
  location            = var.loc1
  provider            = azurerm.conn
  resource_group_name = azurerm_resource_group.rg3.name
  allocation_method   = "Static"
  sku                 = "Standard"
  availability_zone   = "No-Zone"
  tags = {
    Environment            = var.environment_tag
  }
}
resource "azurerm_bastion_host" "Azbast-conn-001-name" {
  name                = "Azbast-conn-001-name"
  location            = var.loc1
  provider            = azurerm.conn
  resource_group_name = azurerm_resource_group.rg3.name
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.vnet-con-prd-001-AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.pip-AzureBastion-conn.id
  }
  tags = {
    Environment            = var.environment_tag

  }
}
