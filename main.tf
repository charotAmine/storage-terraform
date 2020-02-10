
provider "azurerm" {
  version = "=1.36.0"
}

resource "azurerm_resource_group" "octopus" {
  name     = "octopus-deploy-rg"
  location = "westeurope"
}

module "octopus-deploy-runtime" {
  source = "./module"

  location            = azurerm_resource_group.octopus.name
  resource_group_name = azurerm_resource_group.octopus.location

  name             = "001octopusruntime"
  kind             = "Storage"
  tier             = "Standard"
  replication_type = "LRS"

  containers = [
    {
      name        = "octopusbinaries"
      access_type = "private"
    }
  ]
  tags = {
      BU = "Octopus"
  }
}