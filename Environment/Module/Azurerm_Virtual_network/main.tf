resource "azurerm_virtual_network" "vnet" {
    # for_each = var.Vnet
    # depends_on = [ resource.azurerm_resource_group.rg ]
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
}