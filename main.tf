terraform {
  required_version = ">= 1.6.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

module "base-setup" {
  source      = "./modules/base-setup"
  location    = var.location
  environment = var.environment
}
