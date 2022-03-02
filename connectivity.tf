#####################################
# Connectivity
#####################################

######################################
# Hub VNETs
######################################

# Hub Region 1
resource "azurerm_virtual_network" "region1-hub" {
  name                = "${var.code}-vnet-${var.region1code}-hub"
  provider            = azurerm.connectivity
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  address_space       = [var.region1-hub-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
# Hub Region 2
resource "azurerm_virtual_network" "region2-hub" {
  name                = "${var.code}-vnet-${var.region2code}-hub"
  provider            = azurerm.connectivity
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  address_space       = [var.region2-hub-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}
# Hub VNET Peerings
resource "azurerm_virtual_network_peering" "peer1" {
  name                         = "${var.code}-vnet-${var.region1code}-hub-to-vnet-${var.region2code}-hub"
  resource_group_name          = azurerm_resource_group.rg5.name
  virtual_network_name         = azurerm_virtual_network.region1-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer2" {
  name                         = "${var.code}-vnet-${var.region2code}-hub-to-vnet-${var.region1code}-hub"
  resource_group_name          = azurerm_resource_group.rg6.name
  virtual_network_name         = azurerm_virtual_network.region2-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  #use_remote_gateways          = true
}
# Hub Region 1 Subnets
resource "azurerm_subnet" "region1-hub-snet-01" {
  name                 = "snet-${var.region1code}-hub-01"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-01-cidr]
}
resource "azurerm_subnet" "region1-hub-snet-02" {
  name                 = "snet-${var.region1code}-hub-02"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-02-cidr]
}
resource "azurerm_subnet" "region1-hub-snet-azfw" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-azfw-cidr]
}
resource "azurerm_subnet" "region1-hub-snet-azfwman" {
  name                 = "AzureFirewallManagementSubnet"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-azfwman-cidr]
}
resource "azurerm_subnet" "region1-hub-snet-gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-gateway-cidr]
}
resource "azurerm_subnet" "region1-hub-snet-bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-hub.name
  address_prefixes     = [var.region1-hub-snet-bastion-cidr]
}
# Hub Region 1 NSGs
resource "azurerm_network_security_group" "region1-hub-snet-01-nsg" {
  name                = "nsg-${var.region1code}-hub-snet-01"
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
resource "azurerm_network_security_group" "region1-hub-snet-02-nsg" {
  name                = "nsg-${var.region1code}-hub-snet-02"
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
resource "azurerm_subnet_network_security_group_association" "region1-hub-snet-01-nsg" {
  subnet_id                 = azurerm_subnet.region1-hub-snet-01.id
  network_security_group_id = azurerm_network_security_group.region1-hub-snet-01-nsg.id
}
resource "azurerm_subnet_network_security_group_association" "region1-hub-snet-02-nsg" {
  subnet_id                 = azurerm_subnet.region1-hub-snet-02.id
  network_security_group_id = azurerm_network_security_group.region1-hub-snet-02-nsg.id
}

# Hub Region 2 Subnets
resource "azurerm_subnet" "region2-hub-snet-01" {
  name                 = "snet-${var.region2code}-hub-01"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-01-cidr]
}
resource "azurerm_subnet" "region2-hub-snet-02" {
  name                 = "snet-${var.region2code}-hub-02"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-02-cidr]
}
resource "azurerm_subnet" "region2-hub-snet-azfw" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-azfw-cidr]
}
resource "azurerm_subnet" "region2-hub-snet-azfwman" {
  name                 = "AzureFirewallManagementSubnet"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-azfwman-cidr]
}
resource "azurerm_subnet" "region2-hub-snet-gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-gateway-cidr]
}
resource "azurerm_subnet" "region2-hub-snet-bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-hub.name
  address_prefixes     = [var.region2-hub-snet-bastion-cidr]
}
# Hub Region 1 NSGs
resource "azurerm_network_security_group" "region2-hub-snet-01-nsg" {
  name                = "nsg-${var.region2code}-hub-snet-01"
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}
resource "azurerm_network_security_group" "region2-hub-snet-02-nsg" {
  name                = "nsg-${var.region2code}-hub-snet-02"
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}
resource "azurerm_subnet_network_security_group_association" "region2-hub-snet-01-nsg" {
  subnet_id                 = azurerm_subnet.region2-hub-snet-01.id
  network_security_group_id = azurerm_network_security_group.region2-hub-snet-01-nsg.id
}
resource "azurerm_subnet_network_security_group_association" "region2-hub-snet-02-nsg" {
  subnet_id                 = azurerm_subnet.region2-hub-snet-02.id
  network_security_group_id = azurerm_network_security_group.region2-hub-snet-02-nsg.id
}


######################################
# Identity VNETs
######################################
resource "azurerm_virtual_network" "region1-identity" {
  name                = "${var.code}-vnet-${var.region1code}-identity"
  provider            = azurerm.identity
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  address_space       = [var.region1-identity-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Identity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
resource "azurerm_virtual_network" "region2-identity" {
  name                = "${var.code}-vnet-${var.region2code}-identity"
  provider            = azurerm.identity
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  address_space       = [var.region2-identity-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Identity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}

# Identity VNET Peerings
resource "azurerm_virtual_network_peering" "peer3" {
  name                         = "${var.code}-vnet-${var.region1code}-hub-to-vnet-${var.region1code}-identity"
  resource_group_name          = azurerm_resource_group.rg5.name
  virtual_network_name         = azurerm_virtual_network.region1-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-identity.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer4" {
  name                         = "${var.code}-vnet-${var.region1code}-identity-to-vnet-${var.region1code}-hub"
  resource_group_name          = azurerm_resource_group.rg5.name
  virtual_network_name         = azurerm_virtual_network.region1-identity.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}
resource "azurerm_virtual_network_peering" "peer5" {
  name                         = "${var.code}-vnet-${var.region2code}-hub-to-vnet-${var.region2code}-identity"
  resource_group_name          = azurerm_resource_group.rg6.name
  virtual_network_name         = azurerm_virtual_network.region2-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-identity.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer6" {
  name                         = "${var.code}-vnet-${var.region2code}-identity-to-vnet-${var.region2code}-hub"
  resource_group_name          = azurerm_resource_group.rg6.name
  virtual_network_name         = azurerm_virtual_network.region2-identity.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}

# Identity Region 1 Subnets
resource "azurerm_subnet" "region1-identity-snet-01" {
  name                 = "snet-${var.region1code}-identity-01"
  resource_group_name  = azurerm_resource_group.rg5.name
  virtual_network_name = azurerm_virtual_network.region1-identity.name
  address_prefixes     = [var.region1-identity-snet-01-cidr]
}
#resource "azurerm_subnet" "region1-identity-snet-02" {
#  name                 = "snet-${var.region1code}-identity-02"
#  resource_group_name  = azurerm_resource_group.rg5.name
#  virtual_network_name = azurerm_virtual_network.region1-identity.name
#  address_prefixes     = [var.region1-identity-snet-02-cidr]
#}

# Identity Region 2 Subnets
resource "azurerm_subnet" "region2-identity-snet-01" {
  name                 = "snet-${var.region2code}-identity-01"
  resource_group_name  = azurerm_resource_group.rg6.name
  virtual_network_name = azurerm_virtual_network.region2-identity.name
  address_prefixes     = [var.region2-identity-snet-01-cidr]
}
#resource "azurerm_subnet" "region2-identity-snet-02" {
#  name                 = "snet-${var.region2code}-identity-02"
#  resource_group_name  = azurerm_resource_group.rg6.name
#  virtual_network_name = azurerm_virtual_network.region2-identity.name
#  address_prefixes     = [var.region2-identity-snet-02-cidr]
#}

######################################
#Application VNETS
######################################

resource "azurerm_virtual_network" "region1-application" {
  name                = "${var.code}-vnet-${var.region1code}-application"
  provider            = azurerm.business-applications
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg13.name
  address_space       = [var.region1-apps-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "application"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
resource "azurerm_virtual_network" "region2-application" {
  name                = "${var.code}-vnet-${var.region2code}-application"
  provider            = azurerm.business-applications
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg14.name
  address_space       = [var.region2-apps-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "application"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}

# application VNET Peerings
resource "azurerm_virtual_network_peering" "peer7" {
  name                         = "${var.code}-vnet-${var.region1code}-hub-to-vnet-${var.region1code}-application"
  resource_group_name          = azurerm_resource_group.rg5.name
  virtual_network_name         = azurerm_virtual_network.region1-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-application.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer8" {
  name                         = "${var.code}-vnet-${var.region1code}-application-to-vnet-${var.region1code}-hub"
  resource_group_name          = azurerm_resource_group.rg13.name
  virtual_network_name         = azurerm_virtual_network.region1-application.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}
resource "azurerm_virtual_network_peering" "peer9" {
  name                         = "${var.code}-vnet-${var.region2code}-hub-to-vnet-${var.region2code}-application"
  resource_group_name          = azurerm_resource_group.rg6.name
  virtual_network_name         = azurerm_virtual_network.region2-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-application.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer10" {
  name                         = "${var.code}-vnet-${var.region2code}-application-to-vnet-${var.region2code}-hub"
  resource_group_name          = azurerm_resource_group.rg14.name
  virtual_network_name         = azurerm_virtual_network.region2-application.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}

# Application Region 1 Subnets
resource "azurerm_subnet" "region1-application-snet-01" {
  name                 = "snet-${var.region1code}-application-01"
  resource_group_name  = azurerm_resource_group.rg13.name
  virtual_network_name = azurerm_virtual_network.region1-application.name
  address_prefixes     = [var.region1-apps-snet-01-cidr]
}
resource "azurerm_subnet" "region1-application-snet-02" {
  name                 = "snet-${var.region1code}-application-02"
  resource_group_name  = azurerm_resource_group.rg13.name
  virtual_network_name = azurerm_virtual_network.region1-application.name
  address_prefixes     = [var.region1-apps-snet-02-cidr]
}

# Identity Region 2 Subnets
resource "azurerm_subnet" "region2-application-snet-01" {
  name                 = "snet-${var.region2code}-application-01"
  resource_group_name  = azurerm_resource_group.rg14.name
  virtual_network_name = azurerm_virtual_network.region2-application.name
  address_prefixes     = [var.region2-apps-snet-01-cidr]
}
resource "azurerm_subnet" "region2-application-snet-02" {
  name                 = "snet-${var.region2code}-application-02"
  resource_group_name  = azurerm_resource_group.rg14.name
  virtual_network_name = azurerm_virtual_network.region2-application.name
  address_prefixes     = [var.region2-apps-snet-02-cidr]
}

######################################
#Test/Dev VNETS
######################################

resource "azurerm_virtual_network" "region1-devtest" {
  name                = "${var.code}-vnet-${var.region1code}-devtest"
  provider            = azurerm.devtest
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg11.name
  address_space       = [var.region1-devtest-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "devtest"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}
resource "azurerm_virtual_network" "region2-devtest" {
  name                = "${var.code}-vnet-${var.region2code}-devtest"
  provider            = azurerm.devtest
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg12.name
  address_space       = [var.region2-devtest-cidr]
  dns_servers         = var.dns-servers
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "devtest"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}

# devtest VNET Peerings
resource "azurerm_virtual_network_peering" "peer11" {
  name                         = "${var.code}-vnet-${var.region1code}-hub-to-vnet-${var.region1code}-devtest"
  resource_group_name          = azurerm_resource_group.rg5.name
  virtual_network_name         = azurerm_virtual_network.region1-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-devtest.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer12" {
  name                         = "${var.code}-vnet-${var.region1code}-devtest-to-vnet-${var.region1code}-hub"
  resource_group_name          = azurerm_resource_group.rg11.name
  virtual_network_name         = azurerm_virtual_network.region1-devtest.name
  remote_virtual_network_id    = azurerm_virtual_network.region1-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}
resource "azurerm_virtual_network_peering" "peer13" {
  name                         = "${var.code}-vnet-${var.region2code}-hub-to-vnet-${var.region2code}-devtest"
  resource_group_name          = azurerm_resource_group.rg6.name
  virtual_network_name         = azurerm_virtual_network.region2-hub.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-devtest.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
resource "azurerm_virtual_network_peering" "peer14" {
  name                         = "${var.code}-vnet-${var.region2code}-devtest-to-vnet-${var.region2code}-hub"
  resource_group_name          = azurerm_resource_group.rg12.name
  virtual_network_name         = azurerm_virtual_network.region2-devtest.name
  remote_virtual_network_id    = azurerm_virtual_network.region2-hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  #use_remote_gateways          = true
}

# Application Region 1 Subnets
resource "azurerm_subnet" "region1-devtest-snet-01" {
  name                 = "snet-${var.region1code}-devtest-01"
  resource_group_name  = azurerm_resource_group.rg11.name
  virtual_network_name = azurerm_virtual_network.region1-devtest.name
  address_prefixes     = [var.region1-devtest-snet-01-cidr]
}
resource "azurerm_subnet" "region1-devtest-snet-02" {
  name                 = "snet-${var.region1code}-devtest-02"
  resource_group_name  = azurerm_resource_group.rg11.name
  virtual_network_name = azurerm_virtual_network.region1-devtest.name
  address_prefixes     = [var.region1-devtest-snet-02-cidr]
}

# Identity Region 2 Subnets
resource "azurerm_subnet" "region2-devtest-snet-01" {
  name                 = "snet-${var.region2code}-devtest-01"
  resource_group_name  = azurerm_resource_group.rg12.name
  virtual_network_name = azurerm_virtual_network.region2-devtest.name
  address_prefixes     = [var.region2-devtest-snet-01-cidr]
}
resource "azurerm_subnet" "region2-devtest-snet-02" {
  name                 = "snet-${var.region2code}-devtest-02"
  resource_group_name  = azurerm_resource_group.rg12.name
  virtual_network_name = azurerm_virtual_network.region2-devtest.name
  address_prefixes     = [var.region2-devtest-snet-02-cidr]
}

######################################
#Routing
######################################

#r1 route table internet out
resource "azurerm_route_table" "routetable-region1-internet" {
  name                = "${var.code}-routetable-${var.region1code}-to-internet"
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  disable_bgp_route_propagation = false

  route {
    name           = "${var.code}-route-${var.region1code}-to-internet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.region1-fw1.ip_configuration[0].private_ip_address
  }

  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}

#r2 route table internet out
resource "azurerm_route_table" "routetable-region2-internet" {
  name                = "${var.code}-routetable-${var.region2code}-to-internet"
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  disable_bgp_route_propagation = false

  route {
    name           = "${var.code}-route-${var.region2code}-to-internet"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.region2-fw1.ip_configuration[0].private_ip_address
  }

  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}


#r1 route table r1 to r2
resource "azurerm_route_table" "routetable-region1-region2" {
  name                = "${var.code}-routetable-${var.region1code}-${var.region2code}"
  location            = var.region1
  resource_group_name = azurerm_resource_group.rg5.name
  disable_bgp_route_propagation = false

  route {
    name           = "${var.code}-route-${var.region1code}-to-${var.region2code}-identity"
    address_prefix = var.region2-identity-cidr
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.region2-fw1.ip_configuration[0].private_ip_address
  }

  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region1
    Terraform              = "Yes"
  }
}


#r2 route table r2 to r1
resource "azurerm_route_table" "routetable-region2-region1" {
  name                = "${var.code}-routetable-${var.region2code}-${var.region1code}"
  location            = var.region2
  resource_group_name = azurerm_resource_group.rg6.name
  disable_bgp_route_propagation = false

  route {
    name           = "${var.code}-route-${var.region2code}-to-${var.region1code}-identity"
    address_prefix = var.region1-identity-cidr
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.region1-fw1.ip_configuration[0].private_ip_address
  }

  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Connectivity"
    IT-Owner-Contact       = var.tag_IT-Owner-Contact
    Business-Owner-Contact = var.tag_Business-Owner-Contact
    Department             = var.tag_Department
    Hours-Operational      = var.tag_Hours-Operational
    Days-Operational       = var.tag_Days-Operational
    Billed-To              = var.tag_Billed-To
    Cost-Centre            = var.tag_Cost-Centre
    Build-Date             = var.tag_Build-Date
    Geography              = var.region2
    Terraform              = "Yes"
  }
}

resource "azurerm_subnet_route_table_association" "subnetroute1" {
  subnet_id      = azurerm_subnet.region1-hub-snet-azfw.id
  route_table_id = azurerm_route_table.routetable-region1-region2.id
}

resource "azurerm_subnet_route_table_association" "subnetroute2" {
  subnet_id      = azurerm_subnet.region2-hub-snet-azfw.id
  route_table_id = azurerm_route_table.routetable-region2-region1.id
}

resource "azurerm_subnet_route_table_association" "subnetroute3" {
  subnet_id      = azurerm_subnet.region1-identity-snet-01.id
  route_table_id = azurerm_route_table.routetable-region1-internet.id
}

resource "azurerm_subnet_route_table_association" "subnetroute4" {
  subnet_id      = azurerm_subnet.region2-identity-snet-01.id
  route_table_id = azurerm_route_table.routetable-region2-internet.id
}