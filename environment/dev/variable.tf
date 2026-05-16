variable "subscription" {}

variable "rgs" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}
variable "stgs" {
  type = map(object({
    name                     = string
    location                 = string
    rg_name                  = string
    account_tier             = string
    account_replication_type = string
  }))
}
variable "vnets" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
    subnets = map(object({
      address_prefixes = list(string)
      subnet_name      = string
    }))
  }))
}
variable "nics" {
  type = map(object({
    nic_name    = string
    rg_name     = string
    location    = string
    vnet_name   = string
    subnet_name = string
    pip_name    = string

    ip_configurations = map(object({
      ipconfig_name                 = string
      private_ip_address_allocation = string
    }))
  }))
}
variable "pips" {
  type = map(object({
    pip_name          = string
    location          = string
    rg_name           = string
    allocation_method = string
    sku               = string
  }))
}

variable "vms" {
  type = map(object({
    vm_name              = string
    nic_name             = string
    rg_name              = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string

  }))
}

