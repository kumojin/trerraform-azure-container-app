terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.53"
    }
  }

  required_version = "~> 1.3"

  cloud {
    organization = "kumojin"

    workspaces {
      name = "container-app-demo"
    }
  }
}