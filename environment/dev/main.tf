module "rgs" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}
module "stgs" {
  source     = "../../module/azurerm_storage_account"
  depends_on = [module.rgs]
  stgs       = var.stgs
}
module "vnets" {
  source = "../../module/Networking/azurerm_virtual_network"
  depends_on = [ module.rgs ]
  vnets  = var.vnets
}
module "nics" {
  source     = "../../module/Networking/azurerm_nic"
  depends_on = [module.rgs, module.vnets]
  nics       = var.nics
}
module "pips" {
  depends_on = [ module.rgs ]
  source = "../../module/Networking/azurerm_pip"
  pips = var.pips
}
module "vms" {
  depends_on = [ module.rgs, module.nics, module.vnets, module.pips ]
  source = "../../module/azurerm_virtual_machine"
  vms = var.vms
}
