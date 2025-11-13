# resource "azurerm_virtual_network" "vnet1" {
#   name                = "danialvnet"
#   location            = "centralindia"
#   resource_group_name = "danialrg"
#   address_space       = ["10.0.0.0/16"]
# }
# resource "azurerm_subnet" "subnet1" {
#   name                 = "danialsubnet"
#   resource_group_name  = "danialrg"
#   virtual_network_name = azurerm_virtual_network.vnet1.name
#   address_prefixes     = ["10.0.1.0/24"]
# }
# resource "azurerm_network_interface" "nic1" {
#   depends_on = [ azurerm_subnet.subnet1 ]
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
#   depends_on = [ azurerm_subnet.subnet1 ]
#   name                  = "danialvm"
#   location              = "centralindia"
#   resource_group_name   = "danialrg"
#   admin_username        = "shailesh1234"
#   admin_password        = "shailesh@1234"
#   disable_password_authentication = false
#   network_interface_ids = [azurerm_network_interface.nic1.id]
#   size                  = "Standard_B2s"
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