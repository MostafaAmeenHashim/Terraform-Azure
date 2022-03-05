######################################
# Domain Controllers
######################################

# Domain Controller 1

#Create DC availability sets
resource "azurerm_availability_set" "avail-uks-adds1" {
  name                = "avail-uks-adds1"
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg-vnet-ide-001.name
  platform_fault_domain_count = 2

  tags = {
    Environment            = var.environment_tag
  }
}


# Create NIC
resource "azurerm_network_interface" "nic-vm-adds-dc-01" {
  name                = "nic-vm-adds-dc-01"
  location            = var.loc1
  provider            = azurerm.identity
  resource_group_name = azurerm_resource_group.rg-vnet-ide-001.name

  ip_configuration {
    name                          = "ipconfig-adds01"
    subnet_id                     = azurerm_subnet.vnet-ide-prd-001-subnet-ide-prd-001.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    Environment            = var.environment_tag   
   
  }
}
# Create data disk for NTDS storage
resource "azurerm_managed_disk" "disk-data-vm-adds-dc-01" {
  name                 = "disk-data-vm-adds-dc-01"
  location             = var.loc1
  provider             = azurerm.identity
  resource_group_name = azurerm_resource_group.rg4.name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = "20"
  max_shares           = "2"

  tags = {
    Environment            = var.environment_tag   
 
  }
}
# Create Domain Controller VM
resource "azurerm_windows_virtual_machine" "vm-adds-dc-01" {
  name                = "vm-adds-dc-01"
 ## depends_on          = [azurerm_key_vault.kv1]
  resource_group_name = azurerm_resource_group.rg4.name
  location            = var.loc1
  provider            = azurerm.identity
  size                = var.vmsize-domaincontroller
  admin_username      = var.adminusername
  #admin_password      = azurerm_key_vault_secret.vm-default.value
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [azurerm_network_interface.nic-vm-adds-dc-01.id,]

  tags = {
    Environment            = var.environment_tag   
   
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
# Attach Data Disk to Virtual Machine
resource "azurerm_virtual_machine_data_disk_attachment" "dc01-data" {
  provider           = azurerm.identity
  managed_disk_id    = azurerm_managed_disk.disk-data-vm-adds-dc-01.id
  depends_on         = [azurerm_windows_virtual_machine.vm-adds-dc-01]
  virtual_machine_id = azurerm_windows_virtual_machine.vm-adds-dc-01.id
  lun                = "10"
  caching            = "None"
}
