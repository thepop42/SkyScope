provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "example" {
    name     = "theweatherapp-rg"
    location = "West Europe"
}

resource "azurerm_app_service_plan" "example" {
    name                = "theweatherapp-sp"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name

    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "example" {
    name                = "theweatherapp-app"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.example.id

    site_config {
        python_version = "3.4"
    }

    app_settings = {
        "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
}