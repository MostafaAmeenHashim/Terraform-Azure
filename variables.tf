variable "environment_tag" {
  type        = string
  description = "Environment tag value"
}
##RGs
variable "rg-vnet-conn-001-name" {
  type        = string
  description = "connectivity resource group"
}
variable "rg-vng-conn-001-name" {
  description = "VPN resource group"
  type        = string
}
variable "rg-azbast-conn-001-name" {
  description = "Bas Conn resource group"
  type        = string
}
variable "rg-vnet-iden-001-name" {
  description = "Identity vnet resource group"
  type        = string
}

variable "rg-identity-conn-001-name" {
  description = "Identity conn vnet resource group"
  type        = string
}

variable "rg-rsv-iden-001-name" {
  description = "recovery vault identity resource group"
  type        = string
}
variable "rg-vnet-app-001-name" {
  description = "app vnet resource group"
  type        = string
}
variable "rg-rsv-app-001-name" {
  description = "recovery vault app resource group"
  type        = string
}

variable "rg-route-conn-001-name" {
  description = "route table conn resource group"
  type        = string
}
variable "rg-route-dmz-001-name" {
  description = "route table dmz resource group"
  type        = string
}

variable "rg-vnet-dmz-001-name" {
  description = "DMZ vnet resource group"
  type        = string
}
variable "rg-vng-dmz-001-name" {
  description = "DMZ VPN resource group"
  type        = string
}

variable "rg-azbast-dmz-001-name" {
  description = "Batsion DMZ resource group"
  type        = string
}
variable "rg-rsv-dmz-001-name" {
  description = "DMZ recovery vault resource group"
  type        = string
}


##location var
variable "loc1" {
  description = "The location for this Lab environment"
  type        = string
}
variable "vnet-con-prd-001-name" {
  description = "vnet-con-prd-001"
  type        = string
}
variable "vnet-ide-prd-001-name" {
  description = "vnet-ide-prd-001"
  type        = string
}

variable "vnet-app-prd-001-name" {
  description = "vnet-app-prd-001"
  type        = string
}

variable "vnet-dmz-prd-001-name" {
  description = "vnet-dmz-prd-001"
  type        = string
}


##address space for vNets
variable "vnet-con-prd-001-address-space" {
  description = "VNET address space"
  type        = string
}


variable "vnet-ide-prd-001-address-space" {
  description = "VNET address space"
  type        = string
}
variable "vnet-app-prd-001-address-space" {
  description = "VNET address space"
  type        = string
}

variable "vnet-dmz-prd-001-address-space" {
  description = "VNET address space"
  type        = string
}

#snet names
variable "vnet-con-prd-001-GatewaySubnet-name" {
  description = "subnet name"
  type        = string
}

variable "vnet-con-prd-001-AzureBastionSubnet-name" {
  description = "subnet name"
  type        = string
}

variable "vnet-ide-prd-001-subnet-iden-adds-001-name" {
  description = "subnet name"
  type        = string
}

variable "vnet-app-prd-001-subnet-app-prd-001-name" {
  description = "subnet name"
  type        = string
}

variable "vnet-dmz-prd-001-GatewaySubnet-name" {
  description = "subnet name"
  type        = string
}

variable "vnet-dmz-prd-001-AzureBastionSubnet-name" {
  description = "subnet name"
  type        = string
}

##Subnet ranges
variable "vnet-con-prd-001-GatewaySubnet-range" {
  description = "subnet range"
  type        = string
}

variable "vnet-con-prd-001-AzureBastionSubnet-range" {
  description = "subnet range"
  type        = string
}

variable "vnet-ide-prd-001-subnet-iden-adds-001-range" {
  description = "subnet range"
  type        = string
}
variable "vnet-app-prd-001-subnet-app-prd-001-range" {
  description = "subnet range"
  type        = string
}
variable "vnet-dmz-prd-001-GatewaySubnet-range" {
  description = "subnet range"
  type        = string
}
variable "vnet-dmz-prd-001-AzureBastionSubnet-range" {
  description = "subnet range"
  type        = string
}

