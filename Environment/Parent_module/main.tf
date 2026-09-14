module "rg"{
    source = "../Module/Azurerm_Resource_group"
    for_each = var.rgs
    name     = each.value.name
  location = each.value.location
}

module "vnet" {
    for_each = var.Vnet
    source = "../Module/Azurerm_Virtual_network"
    depends_on = [ module.rg ]
  name      = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers
}

module "subnet" {
  for_each = var.subnet
  source = "../Module/Azurerm_Subnet"
  depends_on = [ module.vnet]
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}