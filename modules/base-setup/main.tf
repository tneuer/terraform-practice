resource "azurerm_resource_group" "base_rg" {
  name     = "terraform-test-resource"
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_network" "base_vn" {
  name                = "terraform-test-network"
  resource_group_name = azurerm_resource_group.base_rg.name
  location            = azurerm_resource_group.base_rg.location
  address_space       = ["10.0.0.0/16"]
  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "base_subnet" {
  name                 = "subnet_1"
  resource_group_name  = azurerm_resource_group.base_rg.name
  virtual_network_name = azurerm_virtual_network.base_vn.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "base_subnet2" {
  name                 = "subnet_2"
  resource_group_name  = azurerm_resource_group.base_rg.name
  virtual_network_name = azurerm_virtual_network.base_vn.name
  address_prefixes     = ["10.0.2.0/24"]
}
