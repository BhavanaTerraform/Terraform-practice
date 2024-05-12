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
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource azurerm_resourcegroup "RG"{
  Name = "Resourcegroup01"
  Location = "WestUS"
}

# Create a virtual network within the resource group
resource azurerm_virtualnetwork "VNET"{
  Name = "VirtualNetwork01"
  Vnetresourcegroup = azurerm_resourcegroup.Name
  Location = azurerm_resourcegroup.Location
  address_space = ["10.0.0.0/22"]

}

resource azurerm_Subnet "Subnet"{
  Name = "Subnet01"
  VirtualNetworkName = azurerm_virtualnetwork.Name
  Subnetresourcegroup = azurerm_resourcegroup.Name
  address_space = ["10.1.0.0/24"]
}
