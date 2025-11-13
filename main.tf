# resource "azurerm_virtual_network" "vnet1" {
#   name                = "danialvnet"
#   location            = "centralindia"
#   resource_group_name = "danialrg"
#   address_space       = ["10.0.0.0/16"]
# }
# resource "azurerm_subnet" "subnet1" {
#   name                 = "danialsubnet"
#   virtual_network_name = azurerm_virtual_network.vnet1.name
#   resource_group_name  = "danialrg"
#   address_prefixes     = ["10.0.2.0/24"]
# }
# resource "azurerm_network_interface" "nic1" {
#   depends_on          = [azurerm_subnet.subnet1]
#   name                = "danialnic"
#   location            = "centralindia"
#   resource_group_name = "danialrg"
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet1.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "vm1" {
#   depends_on                      = [azurerm_network_interface.nic1]
#   name                            = "danialvm"
#   location                        = "centralindia"
#   resource_group_name             = "danialrg"
#   admin_username                  = "shaileshadmin"
#   admin_password                  = "shailesh@1234"
#   disable_password_authentication = false
#   size                            = "Standard_B2s"
#   network_interface_ids           = [azurerm_network_interface.nic1.id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }
resource "azurerm_network_security_group" "nsg1" {
  name                = "danialnsg"
  location            = "centralindia"
  resource_group_name = "danialrg"
  security_rule {
    name                         = "nsgrulesecurity"
    priority                     = "100"
    access                       = "Allow"
    protocol                     = "Tcp"
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "*"
    source_address_prefix        = "*"
    destination_address_prefix = "*"
  }

}
resource "azurerm_network_interface_security_group_association" "nic-nsg-association1" {
  network_interface_id = azurerm_network_interface.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}