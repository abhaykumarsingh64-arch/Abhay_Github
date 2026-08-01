module "rg" {
  source = "../Modules/Azurerm_Resourse_group"
  rgs    = var.rgs
}

module "vnet" {
  source     = "../Modules/Azurerm_Networking/Azurerm_Virtual_network"
  depends_on = [module.rg]
  vnet       = var.vnet
}

module "subnet" {
  source     = "../Modules/Azurerm_Networking/Azurerm_Subnet"
  depends_on = [module.vnet]
  subnet     = var.subnet
}

module "pip" {
  source     = "../Modules/Azurerm_Networking/Azurerm_Public_ip"
  depends_on = [module.vnet]
  pips       = var.pips
}

module "vm" {
  source     = "../Modules/Azurerm_compute/Azurerm_Virtual_Machine"
  depends_on = [module.subnet]
  vms        = var.vms
}