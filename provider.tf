terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "dd652dae-3455-4999-8da8-e65662c036aa"
}
