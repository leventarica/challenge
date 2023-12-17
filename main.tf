terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "Ressource_Group_Levent"
  location = "West Europe"
  tags = {
    Author  = ""
    Purpose = ""
  }
}

resource "azurerm_container_registry" "example" {
  name                = "containerregistrylevent"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Basic"
  admin_enabled       = false

  tags = {
    Author  = ""
    Purpose = ""
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  admin_username        = "azureuser"
  location              = "West Europe"
  name                  = "ubuntuvmlevent"
  network_interface_ids = []
  resource_group_name   = "Ressource_Group_Levent"
  size                  = "B1"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    Author  = ""
    Purpose = ""
  }
}

/*resource "azurerm_service_plan" "example" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type = "Linux"
  sku_name = "P1v3"

  tags = {
    Author = ""
    Purpose = ""
  }
}

resource "azurerm_linux_web_app" "example" {
  name                = "cgi-challenge-webapp"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id = azurerm_service_plan.example.id
  #docker_image_name = "containerregistrylevent.azurecr.io/nginx-app:latest"
  #docker_registry_url        = "https://${azurerm_container_registry.example.login_server}"
  #docker_registry_username = azurerm_container_registry.example.admin_username
  #docker_registry_password = azurerm_container_registry.example.admin_password

  site_config {
  }

  app_settings = {
    "WEBSITES_PORT" = "80"
  }

  tags = {
    Author = ""
    Purpose = ""
  }
}*/