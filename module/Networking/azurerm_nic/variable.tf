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
