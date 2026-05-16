data "azurerm_subnet" "subnetdb" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}
data "azurerm_public_ip" "pip_id" {
  for_each            = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
resource "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations
    content {
      name                          = ip_configuration.value.ipconfig_name
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      subnet_id                     = data.azurerm_subnet.subnetdb[each.key].id
      public_ip_address_id          = data.azurerm_public_ip.pip_id[each.key].id
    }
  }

}
