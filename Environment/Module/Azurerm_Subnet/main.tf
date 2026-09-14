resource "azurerm_subnet" "subnet" {
#   for_each = var.subnet
  # depends_on = [ resource.azurerm_virtual_network.vnet ]
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}