######################################
# Resource Groups
######################################

resource "azurerm_resource_group" "rg1" {
  name     = "rg-${var.region1code}-management-prod"
  provider = azurerm.management
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Management"
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
resource "azurerm_resource_group" "rg2" {
  name     = "rg-${var.region2code}-management-prod"
  provider = azurerm.management
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Management"
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
resource "azurerm_resource_group" "rg3" {
  name     = "rg-${var.region1code}-security-prod"
  provider = azurerm.management
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Security"
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
resource "azurerm_resource_group" "rg4" {
  name     = "rg-${var.region2code}-security-prod"
  provider = azurerm.management
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "Security"
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
resource "azurerm_resource_group" "rg5" {
  name     = "rg-${var.region1code}-connectivity-prod"
  provider = azurerm.connectivity
  location = var.region1
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
resource "azurerm_resource_group" "rg6" {
  name     = "rg-${var.region2code}-connectivity-prod"
  provider = azurerm.connectivity
  location = var.region2
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
resource "azurerm_resource_group" "rg7" {
  name     = "rg-${var.region1code}-identity-prod"
  provider = azurerm.identity
  location = var.region1
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
resource "azurerm_resource_group" "rg8" {
  name     = "rg-${var.region2code}-identity-prod"
  provider = azurerm.identity
  location = var.region2
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
resource "azurerm_resource_group" "rg9" {
  name     = "rg-${var.region1code}-asr-prod"
  provider = azurerm.management
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "ASR"
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
resource "azurerm_resource_group" "rg10" {
  name     = "rg-${var.region2code}-asr-prod"
  provider = azurerm.management
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentPROD
    Application-Taxonomy   = "ASR"
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
resource "azurerm_resource_group" "rg11" {
  name     = "rg-${var.region1code}-openhousing-test"
  provider = azurerm.openhousingtest
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "Openhousing Test"
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
resource "azurerm_resource_group" "rg12" {
  name     = "rg-${var.region2code}-openhousing-test"
  provider = azurerm.openhousingtest
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "Openhousing Test"
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
resource "azurerm_resource_group" "rg13" {
  name     = "rg-${var.region1code}-openhousing"
  provider = azurerm.openhousing
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "Openhousing Production"
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
resource "azurerm_resource_group" "rg14" {
  name     = "rg-${var.region2code}-openhousing"
  provider = azurerm.openhousing
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "Openhousing Production"
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
resource "azurerm_resource_group" "rg15" {
  name     = "rg-${var.region1code}-AVD"
  provider = azurerm.avd
  location = var.region1
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "AVD"
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
resource "azurerm_resource_group" "rg16" {
  name     = "rg-${var.region2code}-AVD"
  provider = azurerm.avd
  location = var.region2
  tags = {
    Environment            = var.tag_EnvironmentDEV
    Application-Taxonomy   = "AVD"
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