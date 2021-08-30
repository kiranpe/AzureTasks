#Local Values

locals {
  subnets = [
    {
      name           = "snet01"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "snet02"
      address_prefix = "10.0.2.0/24"
    }
  ]
  common_tags = {
    Env = "Test"
  }
}
