environment_tag                      = "Mostafa CDW LAB Env"
rg-vnet-conn-001-name                = "rg-vnet-conn-001"
rg-vng-conn-001-name                 = "rg-vng-conn-001"
rg-azbast-conn-001-name              = "rg-azbast-conn-001"
rg-vnet-ide-001-name                = "rg-vnet-ide-001"
rg-ide-conn-001-name                 = "rg-ide-conn-001"
rg-rsv-ide-001-name                 = "rg-rsv-ide-001"
rg-vnet-app-001-name                 = "rg-vnet-app-001"
rg-rsv-app-001-name                  = "rg-rsv-app-001"
rg-route-conn-001-name               = "rg-route-conn-001"
rg-route-dmz-001-name                = "rg-route-dmz-001"
rg-vnet-dmz-001-name                 = "rg-vnet-dmz-001"
rg-vng-dmz-001-name                  = "rg-vng-dmz-001"
rg-azbast-dmz-001-name               = "rg-azbast-dmz-001"
rg-rsv-dmz-001-name                  = "rg-rsv-dmz-001"
loc1                                 = "uk south"
## conn vnet and snets
vnet-con-prd-001-name                = "vnet-con-prd-001"
vnet-con-prd-001-address-space       = "10.35.0.0/24"
vnet-con-prd-001-GatewaySubnet-name    = "GatewaySubnet"
vnet-con-prd-001-GatewaySubnet-range = "10.35.0.0/27"
vnet-con-prd-001-AzureBastionSubnet-name    = "AzureBastionSubnet"
vnet-con-prd-001-AzureBastionSubnet-range ="10.35.0.192/26"




## identity vnet and snets
vnet-ide-prd-001-name              = "vnet-ide-prd-001"
vnet-ide-prd-001-address-space      ="10.35.1.0/24"
vnet-ide-prd-001-subnet-ide-adds-001-name    = "subnet-ide-adds-001"
vnet-ide-prd-001-subnet-ide-adds-001-range = "10.35.1.0/27"

## app vnet and snets
vnet-app-prd-001-name            = "vnet-app-prd-001"
vnet-app-prd-001-address-space      ="10.35.2.0/23"
vnet-app-prd-001-subnet-app-prd-001-name    = "subnet-app-001"
vnet-app-prd-001-subnet-app-prd-001-range = "10.35.2.0/24"



## dmz vnet and snets
vnet-dmz-prd-001-name               = "vnet-dmz-prd-001"
vnet-dmz-prd-001-address-space      ="172.16.250.0/24"
vnet-dmz-prd-001-GatewaySubnet-name    = "GatewaySubnet"
vnet-dmz-prd-001-GatewaySubnet-range = "172.16.250.0/27"
vnet-dmz-prd-001-AzureBastionSubnet-name    = "AzureBastionSubnet"
vnet-dmz-prd-001-AzureBastionSubnet-range ="172.16.250.192/26"


## DC VMs
vmsize-domaincontroller     = "Standard_D2s_v4"
#ip-ide-adds-001            = "10.35.1.4"
adminusername               = "dtadmin"

#Bastion hosts
Azbast-conn-001-name        ="Azbast-conn-001"


