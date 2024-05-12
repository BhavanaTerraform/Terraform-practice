# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource azurerm_resource_group "RG"{
  name = "Resourcegroup01"
  location = "WestUS"
}

# Create a virtual network within the resource group
resource azurerm_virtual_network "VNET"{
  name = "VirtualNetwork01"
  resource_group_name = azurerm_resource_group.RG.name
  location = azurerm_resource_group.RG.location
  address_space = ["10.0.0.0/22"]

}

resource azurerm_subnet "Subnet"{
  name = "Subnet01"
  virtual_network_name = azurerm_virtual_network.VNET.name
  resource_group_name = azurerm_resource_group.RG.name
  address_prefixes = ["10.0.2.0/24"]
}
