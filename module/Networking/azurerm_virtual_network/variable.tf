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
